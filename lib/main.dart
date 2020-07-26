import 'package:flutter/material.dart';

import 'animated_text.dart';
import 'fps_viewer.dart';
import 'native_text.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 200, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FpsViewer(),
              AnimatedText('Hybrid composition test'),
              NativeText('Native Text', hybridComposition: true),
            ],
          ),
        ),
      ),
    );
  }
}
