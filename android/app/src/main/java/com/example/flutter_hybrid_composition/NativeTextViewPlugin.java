package com.example.flutter_hybrid_composition;

import android.content.Context;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

class NativeTextView implements PlatformView {
    private final TextView view;

    NativeTextView(Context context, Map<String, Object> params) {
        view = new TextView(context);
        view.setText(params.get("text").toString());
        view.setTextColor(Color.BLACK);
        view.setBackgroundColor(Color.GRAY);
        view.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
    }

    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() { }
}

class NativeTextViewFactory extends PlatformViewFactory {
    NativeTextViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new NativeTextView(context, (Map<String, Object>)args);
    }
}

class NativeTextViewPlugin implements FlutterPlugin {
    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        flutterPluginBinding.getPlatformViewRegistry()
                .registerViewFactory("TextView", new NativeTextViewFactory());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) { }
}
