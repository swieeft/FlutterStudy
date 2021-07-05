import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SoundNumberPad());

class SoundNumberPad extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('number$soundNumber.wav');
  }

  List<Expanded> buildNumberPadButton(List<int> padNumbers) {
    List<Expanded> buttons = [];

    for (var i = 0; i < padNumbers.length; i++) {
      int padNumber = padNumbers[i];

      buttons.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextButton(
            onPressed: () {
              playSound(padNumber);
            },
            child: Center(
              child: Text(
                "$padNumber",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
      ));
    }

    return buttons;
  }

  Expanded buildRow(List<int> padNumbers) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: buildNumberPadButton(padNumbers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sound Number Pad'),
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildRow([1, 2, 3]),
              buildRow([4, 5, 6]),
              buildRow([7, 8, 9]),
              buildRow([0]),
            ],
          ),
        ),
      ),
    );
  }
}
