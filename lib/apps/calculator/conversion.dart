import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  double celsius = 0;
  double fahrenheit = 0;
  double kelvin = 0;

  void convertTemperatures() {
    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
      kelvin = celsius + 273.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Celsius'),
              onChanged: (value) {
                setState(() {
                  celsius = double.tryParse(value) ?? 0;
                  convertTemperatures();
                });
              },
            ),
            SizedBox(height: 20),
            Text('Fahrenheit: ${fahrenheit.toStringAsFixed(2)}°F'),
            Text('Kelvin: ${kelvin.toStringAsFixed(2)} K'),
          ],
        ),
      ),
    );
  }
}
