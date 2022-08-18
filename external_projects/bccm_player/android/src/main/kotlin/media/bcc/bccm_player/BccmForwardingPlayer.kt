package media.bcc.bccm_player

import androidx.media3.common.C
import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.Player

class BccmForwardingPlayer(private val playerController: BccmPlayerController) : ForwardingPlayer(playerController.getExoPlayer()) {
    private var seekBackIncrement: Long = 15000

    private var seekForwardIncrement: Long = 15000

    private val seekCommands = arrayOf(ForwardingPlayer.COMMAND_SEEK_IN_CURRENT_MEDIA_ITEM, ForwardingPlayer.COMMAND_SEEK_BACK, ForwardingPlayer.COMMAND_SEEK_FORWARD)
    private val navigateCommands = arrayOf(ForwardingPlayer.COMMAND_SEEK_TO_NEXT, ForwardingPlayer.COMMAND_SEEK_TO_PREVIOUS, ForwardingPlayer.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM, ForwardingPlayer.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)

    override fun getAvailableCommands(): Player.Commands {
        if (!playerController.isLive) {
            return super.getAvailableCommands()
        }
        val availableCommands = super.getAvailableCommands()
        return Player.Commands.Builder()
                .addAll(availableCommands)
                .removeAll(*seekCommands.toIntArray())
                .removeAll(*navigateCommands.toIntArray())
                .build();
    }

    override fun isCommandAvailable(@Player.Command command: Int): Boolean {
        if (playerController.isLive && seekCommands.contains(command) && navigateCommands.contains(command)) {
            return false;
        }
        return super.isCommandAvailable(command)
    }

    override fun getDuration(): Long {
        return if (playerController.isLive) 0 else super.getDuration()
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