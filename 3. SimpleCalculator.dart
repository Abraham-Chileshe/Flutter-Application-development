/*
pubspec.yaml
-------------------
dependencies:
  flutter:
    sdk: flutter
  math_expressions: ^2.0.1
*/

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        hintColor: Colors.orange,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = "";
  String _result = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "=") {
        try {
          _result = _evaluateExpression(_expression);
        } catch (e) {
          _result = "Ошибка";
        }
      } else if (value == "C") {
        try {
          _expression = "";
          _result = "";
        } catch (e) {
          _result = "Ошибка";
        }
      } else {
        _expression += value;
      }
    });
  }

  String _evaluateExpression(String expression) {
    try {
      final parser = Parser();
      final parsed = parser.parse(expression);
      final contextModel = ContextModel();

      // Evaluate the parsed expression
      final result = parsed.evaluate(EvaluationType.REAL, contextModel);

      // Return the result as a string
      return result.toString();
    } catch (e) {
      return "Ошибка"; // Handle errors, e.g., if the expression is invalid
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AB Calculator'),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: TextStyle(fontSize: 36.0, color: Colors.orange),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("0"),
              _buildButton("C"),
              _buildButton("="),
              _buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () => _onButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
    );
  }
}
