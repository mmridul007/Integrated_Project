import 'package:final_app/apps/portfolio/configs/space.dart';
import 'package:final_app/apps/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';

import 'practice_quiz_page.dart';

class QuizModeSelectionPage extends StatelessWidget {
  const QuizModeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(),
                  ),
                );
              },
              child: Text('Timed Quiz'),
            ),
            Space.y!,
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PracticeQuizPage(),
                  ),
                );
              },
              child: Text('Practice Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
