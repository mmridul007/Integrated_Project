import 'dart:async';

import 'package:final_app/apps/quiz/const/social_media.dart';
import 'package:final_app/apps/quiz/const/text_style.dart';
import 'package:final_app/apps/quiz/question_model.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  int seconds = 15;
  int count = 0;
  Answer? selectedAnswer;
  Timer? timer;
  bool isPassed = false;

  @override
  void initState() {
    super.initState();
    getQuestions();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
          count++;
        } else if (seconds == 0) {
          Navigator.pop(context);
        } else {
          _nextButton();
        }
      });
    });
  }

  gotoNextQuestion() {
    isPassed = false;
    currentQuestionIndex++;
    timer!.cancel();
    seconds = 15;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              normalText(color: Colors.white, size: 24, text: "$seconds"),
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: seconds / 60,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ],
          ),
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
          _cancel(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.orangeAccent : Colors.white,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              gotoNextQuestion();
            });
          }
        },
      ),
    );
  }

  _cancel() {
    return Container(
      child: ElevatedButton(
        child: const Text("Homepage"),
        onPressed: () {
          Navigator.pop(context);
          setState(
            () {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            },
          );
        },
      ),
    );
  }

  _showScoreDialog() {
    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        title + " | Score = $score & Total time = $count",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: Column(
        // Use a Column to layout buttons vertically
        mainAxisSize: MainAxisSize.min, // To make the dialog compact
        children: [
          ElevatedButton(
            child: const Text("Restart"),
            onPressed: () {
              Navigator.pop(context);
              setState(
                () {
                  currentQuestionIndex = 0;
                  score = 0;
                  selectedAnswer = null;
                },
              );
            },
          ),
          SizedBox(height: 10), // Add spacing between buttons
          ElevatedButton(
            child: const Text("Share"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => socialMedia()));
            },
          ),
        ],
      ),
    );
  }
}
