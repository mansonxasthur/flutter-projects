import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _leftDice = 1;
  int _rightDice = 6;

  void _rollDice() {
    setState(() {
      _leftDice = generateRandomNumber();
      _rightDice = generateRandomNumber();
    });
  }

  int generateRandomNumber() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Dice App"),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: InkWell(
                  child: Dice(number: _leftDice),
                  onTap: _rollDice,
                )),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Dice(number: _rightDice),
                onTap: _rollDice,
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Dice extends StatelessWidget {
  const Dice({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/dice$number.png"),
      width: 160,
    );
  }
}
