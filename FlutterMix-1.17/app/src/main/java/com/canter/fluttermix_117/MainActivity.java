package com.canter.fluttermix_117;

import androidx.appcompat.app.AppCompatActivity;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        // 预热一个 FlutterEngine 实例。这样当下次需要显示flutter页面的时候，能迅速显示。
        FlutterEngine flutterEngine = new FlutterEngine(this);

        // 设置 FlutterEngine 执行Dart代码的入口，默认是 main 函数
        flutterEngine.getDartExecutor().executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());

        // 将该 FlutterEngine 实例缓存起来，以便下次需要时直接使用.
        FlutterEngineCache.getInstance().put("my_engine_id", flutterEngine);

        findViewById(R.id.fl_container).setOnClickListener(v -> {
            //用户预热好的FlutterEngine，启动一个 FlutterActivity页面
            startActivity(FlutterActivity.withCachedEngine("my_engine_id").build(this));
        });
    }
}