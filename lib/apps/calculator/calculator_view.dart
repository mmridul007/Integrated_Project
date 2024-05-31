import 'package:final_app/apps/calculator/conversion.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calc_button.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "DEL") {
        if (equation == "sin" ||
            equation == "cos" ||
            equation == "tan" ||
            equation == "log" ||
            equation == "^-1") {
          equation = equation.substring(0, equation.length - 3);
        } else if (equation == "ln" || equation == "^2") {
          equation = equation.substring(0, equation.length - 2);
        } else {
          equation = equation.substring(0, equation.length - 1);
        }
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "T") {
        TemperatureConverterApp();
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');
        expression = expression.replaceAll('π', '3.1416');
        expression = expression.replaceAll('e', '2.71828');
        expression = expression.replaceAll('√', 'sqrt');
        expression = expression.replaceAll('^', '^');
        expression = expression.replaceAll('sin', 'sin');
        expression = expression.replaceAll('cos', 'cos');
        expression = expression.replaceAll('tan', 'tan');
        expression = expression.replaceAll('log', 'log(2)');
        expression = expression.replaceAll('ln', 'ln');
        expression = expression.replaceAll('C', 'Celsius');
        expression = expression.replaceAll('K', 'Kelvin');
        expression = expression.replaceAll('F', 'Fahrenheit');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(5),
      child: Scaffold(
          backgroundColor: Colors.black54,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(result,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 80))),
                              const Icon(Icons.more_vert,
                                  color: Colors.orange, size: 30),
                              const SizedBox(width: 1),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(equation,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.white38,
                                    )),
                              ),
                              IconButton(
                                icon: const Icon(Icons.backspace_outlined,
                                    color: Colors.orange, size: 30),
                                onPressed: () {
                                  //buttonPressed("⌫");
                                },
                              ),
                              const SizedBox(width: 1),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              'AC', Colors.white10, () => buttonPressed('AC')),
                          calcButton('DEL', Colors.white10,
                              () => buttonPressed('DEL')),
                          calcButton('sin', Colors.white10,
                              () => buttonPressed('sin')),
                          calcButton("cos", Colors.white10,
                              () => buttonPressed('cos')),
                          calcButton("tan", Colors.white10,
                              () => buttonPressed('tan')),
                        ],
                      ),
                      const SizedBox(height: 1),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton('x^-1', Colors.white10,
                              () => buttonPressed('^-1')),
                          calcButton(
                              'x^2', Colors.white10, () => buttonPressed('^2')),
                          calcButton(
                              'x^', Colors.white10, () => buttonPressed('^')),
                          calcButton("log", Colors.white10,
                              () => buttonPressed('log')),
                          calcButton(
                              "ln", Colors.white10, () => buttonPressed('ln')),
                        ],
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '(', Colors.white10, () => buttonPressed('(')),
                          calcButton(
                              ')', Colors.white10, () => buttonPressed(')')),
                          calcButton(
                              '%', Colors.white10, () => buttonPressed('%')),
                          calcButton(
                              '÷', Colors.white10, () => buttonPressed('÷')),
                          calcButton(
                              "×", Colors.white10, () => buttonPressed('×')),
                        ],
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '√', Colors.white24, () => buttonPressed('√')),
                          calcButton(
                              '7', Colors.white24, () => buttonPressed('7')),
                          calcButton(
                              '8', Colors.white24, () => buttonPressed('8')),
                          calcButton(
                              '9', Colors.white24, () => buttonPressed('9')),
                          calcButton(
                              '-', Colors.white10, () => buttonPressed('-')),
                        ],
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              'π', Colors.white24, () => buttonPressed('π')),
                          calcButton(
                              '4', Colors.white24, () => buttonPressed('4')),
                          calcButton(
                              '5', Colors.white24, () => buttonPressed('5')),
                          calcButton(
                              '6', Colors.white24, () => buttonPressed('6')),
                          calcButton(
                              '+', Colors.white10, () => buttonPressed('+')),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // calculator number buttons

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    calcButton('e', Colors.white24,
                                        () => buttonPressed('e')),
                                    calcButton('1', Colors.white24,
                                        () => buttonPressed('1')),
                                    calcButton('2', Colors.white24,
                                        () => buttonPressed('2')),
                                    calcButton('3', Colors.white24,
                                        () => buttonPressed('3')),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    calcButton('C', Colors.white24,
                                        () => buttonPressed('T')),
                                    calcButton('0', Colors.white24,
                                        () => buttonPressed('0')),
                                    calcButton('.', Colors.white24,
                                        () => buttonPressed('.')),
                                    calcButton('+/-', Colors.white24,
                                        () => buttonPressed('+/-')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: calcButton(
                                '=', Colors.orange, () => buttonPressed('=')),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
