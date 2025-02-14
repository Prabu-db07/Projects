import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = "";

  void calculate(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    double res = 0;

    switch (operation) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num2 != 0 ? num1 / num2 : double.nan;
        break;
      case '%':
        res = num2 != 0 ? num1 % num2 : double.nan;
        break;
    }

    setState(() {
      result = "Result: ${res.toStringAsFixed(2)}";
    });
  }

  void clearFields() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter first number"),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter second number"),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => calculate('+'),
                  child: Text('+'),
                ),
                OutlinedButton(
                  onPressed: () => calculate('-'),
                  child: Text('-'),
                ),
                OutlinedButton(
                  onPressed: () => calculate('*'),
                  child: Text('*'),
                ),
                OutlinedButton(
                  onPressed: () => calculate('/'),
                  child: Text('/'),
                ),
                OutlinedButton(
                  onPressed: () => calculate('%'),
                  child: Text('%'),


                ),
                 OutlinedButton(
                  onPressed: () => num1Controller,
                  child: Text('9'),
                ),
              ],
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: clearFields,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Clear"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
