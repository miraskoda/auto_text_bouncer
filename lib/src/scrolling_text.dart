import 'dart:async';

import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';

/// A widget that displays text with auto-scrolling animation.
class ScrollingText extends StatelessWidget {
  /// Creates a scrolling text widget.
  const ScrollingText({
    required this.text,
    required this.axis,
    super.key,
    this.speed = 5.0,
    this.restTime = 1000,
    this.style,
  });

  /// The text to display.
  final String text;

  /// The speed of the scrolling animation.
  final double speed;

  /// The time to rest between scrolls in milliseconds.
  final int restTime;

  /// The axis along which the text should scroll.
  final Axis axis;

  /// The text style to use.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.vertical
        ? _ScrollingVerticalText(
            speed: speed,
            restTime: restTime,
            text: text,
            style: style,
          )
        : AutoScrollText(
            text,
            style: style,
            delayBefore: Duration(milliseconds: restTime),
            pauseBetween: Duration(milliseconds: restTime),
            velocity: Velocity(pixelsPerSecond: Offset(speed * 4.0, 0)),
            mode: AutoScrollTextMode.bouncing,
          );
  }
}

class _ScrollingVerticalText extends StatefulWidget {
  const _ScrollingVerticalText({
    required this.text,
    this.style,
    this.speed = 5.0,
    this.restTime = 1000,
  });

  final String text;
  final TextStyle? style;
  final double speed;
  final int restTime;

  @override
  State<StatefulWidget> createState() => _ScrollingVerticalTextState();
}

class _ScrollingVerticalTextState extends State<_ScrollingVerticalText> {
  ScrollController? scrollController;
  double position = 0;
  Timer? timer;
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  void startTimer() {
    if (key.currentContext != null && context.mounted) {
      timer = Timer.periodic(Duration(milliseconds: widget.restTime),
          (timer) async {
        final maxScrollExtent = scrollController!.position.maxScrollExtent;
        final pixels = scrollController!.position.pixels;
        if (maxScrollExtent == 0) return;
        if (pixels + widget.speed >= maxScrollExtent) {
          await Future.delayed(
            Duration(milliseconds: widget.restTime),
          );
          position = 0.0;
          if (scrollController?.hasClients ?? false) {
            await scrollController!.animateTo(
              position,
              duration: Duration(milliseconds: widget.restTime),
              curve: Curves.linear,
            );
          }
          return;
        }
        position += widget.speed;
        if (scrollController?.hasClients ?? false) {
          await scrollController!.animateTo(
            position,
            duration: Duration(milliseconds: widget.restTime),
            curve: Curves.linear,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        key: key,
        controller: scrollController,
        children: <Widget>[
          Text(
            widget.text,
            style: widget.style,
          ),
        ],
      ),
    );
  }
}
