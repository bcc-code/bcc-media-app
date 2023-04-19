package media.bcc.bccm_player

import android.app.Activity
import android.util.Log
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi

object BccmPlayerPluginSingleton {

    val activityState = MutableStateFlow<Activity?>(null)
    val npawConfigState = MutableStateFlow<PlaybackPlatformApi.NpawConfig?>(null)
    val appConfigState = MutableStateFlow<PlaybackPlatformApi.AppConfig?>(null)
    val eventBus = MutableSharedFlow<BccmPlayerPluginEvent>()
    private val mainScope = CoroutineScope(Dispatchers.Main + Job())

    init {
        Log.d("bccm", "bccmdebug: created BccmPlayerPluginSingleton")
        mainScope.launch { keepTrackOfActivity() }
    }

    private suspend fun keepTrackOfActivity() {
        eventBus.filter { event -> event is AttachedToActivityEvent }.collect { event ->
            activityState.update { (event as AttachedToActivityEvent).activity }
        }
    }
}