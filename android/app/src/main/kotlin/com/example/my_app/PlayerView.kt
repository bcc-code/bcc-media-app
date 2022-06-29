package com.example.my_app

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


internal class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context!!, id, creationParams)
    }
}

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView
    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 72f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "Rendered on a native Android view (id: $id)"
    }
}