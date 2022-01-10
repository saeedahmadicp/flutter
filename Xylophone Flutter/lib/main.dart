import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playMusic(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey(int noteNumber, Color color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playMusic(noteNumber);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.yellow),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.orangeAccent),
              buildKey(4, Colors.deepOrangeAccent),
              buildKey(5, Colors.deepOrange),
              buildKey(6, Colors.pink),
              buildKey(7, Colors.pinkAccent),
            ],
          ),
        ),
      ),
    );
  }
}
