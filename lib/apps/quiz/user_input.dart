import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State {
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  TextEditingController _option1Controller = TextEditingController();
  TextEditingController _option2Controller = TextEditingController();
  TextEditingController _option3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Enter question',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Enter correct answer',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _option1Controller,
              decoration: InputDecoration(
                labelText: 'Option 1',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _option2Controller,
              decoration: InputDecoration(
                labelText: 'Option 2',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _option3Controller,
              decoration: InputDecoration(
                labelText: 'Option 3',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Process the question, answer, and options here
                String question = _questionController.text;
                String answer = _answerController.text;
                String option1 = _option1Controller.text;
                String option2 = _option2Controller.text;
                String option3 = _option3Controller.text;
                // You can now do whatever you want with the question, answer, and options,
                // such as adding them to a list of quiz questions.

                void writeToFile(String filePath, String data) async {
                  final file = File('new_question.dart');

                  // Mode.append will add to the end of an existing file,
                  // or create the file if it doesn't exist
                  final randomAccessFile =
                      await file.open(mode: FileMode.append);

                  // Write your data
                  await randomAccessFile
                      .writeString(data + '\n'); // Add a newline for formatting

                  // Close the file
                  await randomAccessFile.close();
                }

                // ... (Your existing code where questions, options, etc. are generated
                String dataToWrite =
                    'Question: $question, Answer: $answer, Options: [$option1, $option2, $option3]';

                String filePath = 'your_desired_file_path.txt';
                writeToFile(filePath, dataToWrite);

                // print(
                //     'Question: $question, Answer: $answer, Options: [$option1, $option2, $option3]');

                _questionController.clear();
                _answerController.clear();
                _option1Controller.clear();
                _option2Controller.clear();
                _option3Controller.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
