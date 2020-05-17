package com.canter.fluttermodule;

import androidx.appcompat.app.AppCompatActivity;
import io.flutter.facade.Flutter;
import io.flutter.view.FlutterView;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        FlutterView flutterView = Flutter.createView(this, getLifecycle(), "initialRoute");
        setContentView(flutterView);
    }
}
