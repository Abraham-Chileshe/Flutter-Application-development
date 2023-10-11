/* 
Конвертер температуры. Экран приложения должен содержать текстовое поле для ввода температуры в градусах Цельсия
и кнопку для конвертации температуры в градусы Фаренгейта. При вводе температуры в градусах Цельсия и нажатии 
на кнопку конвертации, приложение должно выводить эквивалентную температуру в градусах Фаренгейта, 
используя формулу: Fahrenheit = (Celsius * 9/5) + 32.
*/

import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: TemperatureConverter(),
        );
    }
}

class TemperatureConverter extends StatefulWidget {
    @override
    _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
    double _celsius = 0;
    double _fahrenheit = 0;

    void _convertTemperature() {
        setState(() {
            _fahrenheit = (_celsius * 9/5) + 32;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Конвертер температуры'),
                backgroundColor: Colors.orange[800],
                centerTitle: true,
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        SizedBox(height: 100),
                        Text(
                            'Введите температуру в градусах Цельсия:',
                            style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                                setState(() {
                                    _celsius = double.tryParse(value) ?? 0;
                                });
                            },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: _convertTemperature,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[800],
                            ),
                            child: Text('Конвертировать'),
                        ),
                        SizedBox(height: 60),
                        Text(
                            'Фаренгейта:',
                            style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Text(
                            '$_fahrenheit °F',
                            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                    ],
                ),
            ),
        );
    }
}
