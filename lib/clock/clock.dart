import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        second++;
        int hours = second ~/ 3600;
        int minutes = (second % 3600) ~/ 60;
        int seconds = second % 60;
        String formattedTime =
            '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        return Card(
            child: ListTile(
                title: Center(
          child: Text(formattedTime, style: const TextStyle(fontSize: 20.0)),
        )));
      },
    );
  }

  String getTime(seconds) {
    return seconds;
  }
}

int second = 0;
int minutes = 0;
int hours = 0;
