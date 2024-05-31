import 'package:final_app/apps/quiz/const/colors.dart';
import 'package:final_app/apps/quiz/const/images.dart';
import 'package:final_app/apps/quiz/const/text_style.dart';
import 'package:final_app/apps/quiz/quiz_mode/quiz_mode_selection_page.dart';
import 'package:final_app/apps/quiz/user_input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuizAppRoot());
}

class QuizAppRoot extends StatelessWidget {
  const QuizAppRoot({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Quiz App",
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [blue, darkBlue],
          )),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                children: [
                  Image.asset(
                    balloon2,
                    width: orientation == Orientation.portrait
                        ? size.width * 0.6
                        : size.height * 0.3,
                    height: orientation == Orientation.portrait
                        ? size.width * 0.6
                        : size.height * 0.3,
                  ),
                  const SizedBox(height: 20),
                  normalText(color: lightgrey, size: 18, text: "Welcome to our"),
                  headingText(color: Colors.white, size: 32, text: "Quiz App"),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        width: size.width * 0.8,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: headingText(
                            color: blue, size: 18, text: "Input Question"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuizModeSelectionPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        width: size.width * 0.8,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: headingText(color: blue, size: 18, text: "Continue"),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
