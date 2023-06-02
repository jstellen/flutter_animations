
import 'package:flutter/material.dart';

import 'jack.dart';

class FunkyHomeView extends StatefulWidget {
  const FunkyHomeView({super.key, required this.title});

  final String title;

  @override
  State<FunkyHomeView> createState() => _FunkyHomeViewState();
}

class _FunkyHomeViewState extends State<FunkyHomeView>
    with TickerProviderStateMixin {
  double height = 100;
  double width = 100;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
  }

  void _zoomBox() {
    if (width == 100) {
      setState(() {
        width = 200;
        height = 200;
      });
    } else {
      setState(() {
        width = 100;
        height = 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 196, 15, 15),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.man),
          onPressed: () {
            _jackView(context);
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
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(controller),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: height,
            width: width,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _zoomBox,
            child: const Icon(Icons.zoom_in),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.forward();
            },
            child: const Text(
              'Spin',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.reset();
            },
            child: const Text(
              'Stop',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _jackView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const JumpingJackView(title: 'Jumping Jack',),
      ),
    );
  }
}
