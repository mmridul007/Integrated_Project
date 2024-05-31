import 'package:flutter/material.dart';

class PracticeQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Practice Quiz',
              style: TextStyle(fontSize: 24),
            ),
            // Add your quiz questions and options here
          ],
        ),
      ),
    );
  }
}
