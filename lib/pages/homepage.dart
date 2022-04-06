import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 280,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 5),
            ),
            child: Text(
              returnresetvalue(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: MaterialButton(
              onPressed: () {
                handlestartstop();
              },
              child: const Icon(
                Icons.play_circle_rounded,
                color: Colors.blue,
                size: 70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: ElevatedButton(
                onPressed: () {
                  stopwatch.reset();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      )),
    );
  }

  late Stopwatch stopwatch;
  late Timer t;

  void handlestartstop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnresetvalue() {
    var watch = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (watch % 1000).toString().padLeft(3, "0");
    String seconds = ((watch ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((watch ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hours = ((watch ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(const Duration(microseconds: 30), (timer) {
      setState(() {});
    });
  }
}
