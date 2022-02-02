package com.maru.android_view_surface_sample

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

typealias MessageCodec = (Map<String?, Any?>)

class NativeSurfaceViewFactory : PlatformViewFactory(StandardMessageCodec()) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val params = args as MessageCodec?
        return NativeSurfaceView(context, viewId, params)
    }
}

class NativeSurfaceView(context: Context, viewId: Int, params: MessageCodec?) : PlatformView {
    private val textView: TextView

    init {
        textView = TextView(context)
        textView.text = "NativeSurfaceView"
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {
        // pass
    }

}