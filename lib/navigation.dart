import 'package:final_app/apps/calculator/main.dart';
import 'package:final_app/apps/portfolio/main.dart';
import 'package:final_app/apps/quiz/main.dart';
import 'package:final_app/apps/weather/main.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle),
            label: 'Portfolio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calculate),
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.quiz),
            icon: Icon(Icons.quiz),
            label: 'Quiz App',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.cloud),
            icon: Icon(Icons.cloud),
            label: 'Weather App',
          ),
        ],
      ),
      body: <Widget>[
        /// Portfolio
        PortfolioApp(),

        /// Calculator
        CalculatorApp(),

        /// Quiz App
        QuizApp(),

        /// Weather App
        WeatherApp(),
      ][currentPageIndex],
    );
  }
}
