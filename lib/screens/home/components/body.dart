import 'dart:math';
import 'package:flutter/material.dart';
import 'package:song_association/screens/home/components/background.dart';
import 'package:song_association/components/rounded_botton.dart';
import 'package:flutter_svg/svg.dart';
import 'package:song_association/words/words.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
          Text(
            "YOUR WORD IS:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RandomWord(),
        ])));
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        child: Text(all[Random().nextInt(all.length)]),
      ),
    ]);
  }
}

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: buildTime()),
      );

  Widget buildTime() {}
}
