import 'dart:async';

import 'package:flutter/material.dart';

class TimedQuizPage extends StatefulWidget {
  @override
  _TimedQuizPageState createState() => _TimedQuizPageState();
}

class _TimedQuizPageState extends State<TimedQuizPage> {
  late Timer _timer;
  int _start = 30; // Set your desired quiz time limit

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          // Handle the end of the quiz
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timed Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time left: $_start seconds',
              style: TextStyle(fontSize: 24),
            ),
            // Add your quiz questions and options here
          ],
        ),
      ),
    );
  }
}
