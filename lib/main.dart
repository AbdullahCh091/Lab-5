import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
//import 'package:flutter_sound/flutter_sound.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(child: button(1, Colors.yellow)),
              Expanded(child: button(2, Colors.black)),
              Expanded(child: button(3, Colors.purple)),
              Expanded(child: button(4, Colors.blue)),
              Expanded(child: button(5, Colors.orange)),
              Expanded(child: button(6, Colors.red)),
              Expanded(child: button(7, Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Container button(int i, Color c) {
    return Container(
      child: TextButton(
          child: Container(width: 80),
          onPressed: () {
            final AudioCache player = AudioCache();
            player.play('note$i.wav');
          }),
      height: double.infinity,
      width: 100,
      color: c,
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double i = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ask Me Anything'),
            backgroundColor: Colors.blue[900],
          ),
          backgroundColor: Colors.blue,
          body: Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Image(image: AssetImage('images/ball$i.png')),
              onPressed: () {
                print('I got Clicked');
                setState(() {
                  i = Random().nextInt(5) + 1;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
