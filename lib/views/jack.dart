import 'dart:math';

import 'package:flutter/material.dart';

class JumpingJackView extends StatefulWidget {
  const JumpingJackView({super.key, required this.title});
  final String title;

  @override
  State<JumpingJackView> createState() => _JumpingJackViewState();
}

class _JumpingJackViewState extends State<JumpingJackView> {
  double boxX = 0;
  double boxY = 0;

  void _moveBox() {
    Random R = Random();
    setState(() {
      boxX = R.nextDouble();
      boxY = R.nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.title),
        actions: [
          PopupMenuButton<Text>(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("POP")),
              const PopupMenuItem(child: Text("UP")),
              const PopupMenuItem(child: Text("MENU")),
            ];
          })
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment(boxX, boxY),
          child: const Icon(Icons.directions_walk),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveBox,
        child: const Text("Jump"),
      ),
    );
  }
}
