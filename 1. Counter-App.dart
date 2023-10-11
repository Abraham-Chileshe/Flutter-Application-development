import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: CounterApp(),
        );
    }
}

class CounterApp extends StatefulWidget {
    @override
    _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
    int _counter = 0;

    void _incrementCounter() {
        setState(() {
            _counter++;
        });
    }

    void _decrementCounter() {
        setState(() {
            _counter--;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Простой счетчик'),
                centerTitle: true,
                backgroundColor: Colors.pink[800]
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text(
                            'Значение счетчика:',
                            style: TextStyle(
                                fontSize: 25,
                            ),
                        ),
                        Text(
                            '$_counter',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                ElevatedButton(
                                    onPressed: _incrementCounter,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.pink[800], // Background color
                                    ),
                                    child: Icon(Icons.add),
                                ),
                                ElevatedButton(
                                    onPressed: _decrementCounter,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.pink[800], // Background color
                                    ),
                                    child: Icon(Icons.remove),
                                ),

                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}
