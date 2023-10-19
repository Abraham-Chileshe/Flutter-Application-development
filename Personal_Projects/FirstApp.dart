import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text("Application"),
                centerTitle:true,
                backgroundColor: Colors.pink[800],
            ),

            body: Center(
                child:Text(
                    "Abraham",
                    style:TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[800],
                        fontFamily: "myfont",
                    ),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Text("+"),
                backgroundColor: Colors.pink[800],
            ),
        );
    }
}
