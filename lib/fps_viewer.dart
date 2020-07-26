import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FpsViewer extends StatefulWidget {
  @override
  _FpsViewerState createState() => _FpsViewerState();
}

class _FpsViewerState extends State<FpsViewer>
    with SingleTickerProviderStateMixin {
  Ticker ticker;
  Timer timer;
  int frames = 0;
  int fps = 0;
  static const int kInterval = 2000;

  @override
  void initState() {
    super.initState();
    ticker = createTicker((_) => _onTick());
    timer =
        Timer.periodic(Duration(milliseconds: kInterval), (_) => _onTimer());
    ticker.start();
  }

  void _onTick() {
    frames++;
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  void _onTimer() {
    setState(() {
      fps = ((frames * 1000.0) / kInterval).round();
    });
    frames = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Text('FPS: $fps', style: Theme.of(context).textTheme.headline6);
  }
}
