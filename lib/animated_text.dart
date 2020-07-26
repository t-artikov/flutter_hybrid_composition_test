import 'dart:async';

import 'package:flutter/widgets.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  const AnimatedText(this.text);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  Timer timer;
  double x = -0.7;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _changePosition();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _changePosition() {
    setState(() {
      x = -x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
        alignment: Alignment(x, 0),
        child: Text(widget.text),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut);
  }
}
