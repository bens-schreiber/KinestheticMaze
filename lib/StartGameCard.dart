import 'package:flutter/material.dart';

class StartGameCard extends StatelessWidget {
  const StartGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.greenAccent,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Center(child: Text('Welcome to the Kinaesthetic Maze Game')),
              subtitle: Center(child: Text('Please play :)')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: TextButton(
                  child: const Text('Play Game'),
                  onPressed: () {/* ... */},
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
