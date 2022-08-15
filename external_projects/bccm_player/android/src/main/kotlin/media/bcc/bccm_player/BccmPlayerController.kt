package media.bcc.bccm_player

import android.content.Context
import androidx.media3.common.*
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import java.util.*

class BccmPlayerController(context: Context) {
    val id: String = UUID.randomUUID().toString()
    private val exoPlayer: ExoPlayer
    private val forwardingPlayer: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null
    var isLive: Boolean = false
        private set

    init {
        exoPlayer = ExoPlayer.Builder(context)
                .setAudioAttributes(AudioAttributes.DEFAULT, /* handleAudioFocus= */ true)
                .build()

        forwardingPlayer = object : ForwardingPlayer(exoPlayer) {
            private var seekBackIncrement: Long = 15000

            private var seekForwardIncrement: Long = 15000

            override fun getAvailableCommands(): Player.Commands {
                if (!isLive) {
                    return super.getAvailableCommands()
                }
                val seekCommands = arrayOf(COMMAND_SEEK_IN_CURRENT_MEDIA_ITEM, COMMAND_SEEK_BACK, COMMAND_SEEK_FORWARD)
                val navigateCommands = arrayOf(COMMAND_SEEK_TO_NEXT, COMMAND_SEEK_TO_PREVIOUS, COMMAND_SEEK_TO_NEXT_MEDIA_ITEM, COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)
                val availableCommands = super.getAvailableCommands()
                return Player.Commands.Builder()
                        .addAll(availableCommands)
                        .removeAll(*seekCommands.toIntArray())
                        .removeAll(*navigateCommands.toIntArray())
                        .build();
            }

            override fun isCommandAvailable(@Player.Command command: Int): Boolean {
                val seekCommands = arrayOf(COMMAND_SEEK_IN_CURRENT_MEDIA_ITEM, COMMAND_SEEK_BACK, COMMAND_SEEK_FORWARD)
                val navigateCommands = arrayOf(COMMAND_SEEK_TO_NEXT, COMMAND_SEEK_TO_PREVIOUS, COMMAND_SEEK_TO_NEXT_MEDIA_ITEM, COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)

                if (isLive && seekCommands.contains(command) && navigateCommands.contains(command)) {
                    return false;
                }
                return super.isCommandAvailable(command)
            }

            override fun getDuration(): Long {
                return if (isLive) {
                    0
                } else {
                    super.getDuration();
                }
            }

            override fun getSeekBackIncrement(): Long {
                return seekBackIncrement
            }

            override fun seekBack() {
                seekToOffset(-seekBackIncrement)
            }

            override fun getSeekForwardIncrement(): Long {
                return seekForwardIncrement
            }

            override fun seekForward() {
                seekToOffset(seekForwardIncrement)
            }

            private fun seekToOffset(offsetMs: Long) {
                var positionMs = currentPosition + offsetMs
                val durationMs = duration
                if (durationMs != C.TIME_UNSET) {
                    positionMs = java.lang.Long.min(positionMs, durationMs)
                }
                positionMs = java.lang.Long.max(positionMs, 0)
                seekTo(positionMs)
            }
        }
    }

    fun getExoPlayer(): Player {
        return forwardingPlayer;
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView() ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();
        if (currentPlayerView != null) {
            PlayerView.switchTargetView(getExoPlayer(), currentPlayerView, playerView)
        } else {
            playerView.player = getExoPlayer()
        }
        //previousPvWrapper?.dispose()
        /*if (previousPvWrapper?.isFullscreenPlayer() == true) {
            previousPvWrapper.dispose()
        }*/

        pvWrapper.onDispose = {
            if (pvWrapper.isFullscreenPlayer()) {
                previousPvWrapper?.run {
                    //takeOwnership(previousPvWrapper)
                    this.setup()
                };
            } else {
                currentPlayerViewWrapper = null
            }
        }
    }

    fun playWithUrl(url: String, isLive: Boolean = false) {
        this.isLive = isLive;
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()
    }

    fun release() {
        exoPlayer.release()
    }
}