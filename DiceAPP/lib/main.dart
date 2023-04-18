import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _diceOne = 1;
  int _diceTwo = 1;
  int _counter = 0;

  void _rollDice() {
    setState(() {
      _diceOne = Random().nextInt(6) + 1;
      _diceTwo = Random().nextInt(6) + 1;
      _counter = _diceOne + _diceTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dice Total: $_counter',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '../assets/dice$_diceOne.png',
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Image.asset(
                '../assets/dice$_diceTwo.png',
                width: 150.0,
                height: 150.0,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rollDice,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
