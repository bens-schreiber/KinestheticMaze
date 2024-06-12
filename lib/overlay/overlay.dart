import 'package:flutter/material.dart';
import 'package:hackathon_2024/clock/clock.dart';
import 'package:hackathon_2024/gyroscope/gyroscope.dart';

class GameOverlay extends StatelessWidget {
  const GameOverlay({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        child,
        const Opacity(opacity: 0.5, child: _GameOverlay()),
      ],
    ));
  }
}

class _GameOverlay extends StatelessWidget {
  const _GameOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: true,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('IntelliTect Hackathon 2024'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: const Column(
            children: [
              ClockWidget(),
              GameText(),
              SizedBox(height: 100),
              GyroscopeContainer(
                child: Gyroscope(),
              ),
              Spacer(),
              Text("Tap anywhere to move!"),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}

final gameOverlayTextNotifier = ValueNotifier<String>("");

class GameText extends StatelessWidget {
  const GameText({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: gameOverlayTextNotifier,
        builder: (context, value, child) {
          return value.isNotEmpty
              ? Text(value.toString(), style: const TextStyle(fontSize: 20.0))
              : const SizedBox.shrink();
        });
  }
}

class CircleDesign extends StatelessWidget {
  const CircleDesign(
      {required this.opacity,
      required this.height,
      required this.width,
      super.key});
  final double height;
  final double width;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).focusColor, width: 3.0),
          ),
        ));
  }
}

class GyroscopeContainer extends StatelessWidget {
  const GyroscopeContainer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleDesign(opacity: 0.25, height: 100, width: 100),
        const CircleDesign(opacity: 0.35, height: 200, width: 200),
        const CircleDesign(opacity: 0.5, height: 300, width: 300),
        const CircleDesign(opacity: 0.7, height: 380, width: 380),
        const CircleDesign(opacity: 1, height: 400, width: 400),
        child,
      ],
    );
  }
}
