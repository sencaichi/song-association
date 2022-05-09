import 'dart:math';
import 'dart:async';
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
    // Size size = MediaQuery.of(context).size;
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
          Countdown(),
        ])));
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  static var randomWord = all[Random().nextInt(all.length)];

  @override
  void initState() {
    super.initState();

    reset();
  }

  void reset() {
    setState(() => randomWord = all[Random().nextInt(all.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              randomWord,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50,
              ),
            )),
      ),
      RoundedButton(
          text: "GIVE ME A WORD",
          press: () {
            reset();
          }),
    ]);
  }
}

class Countdown extends StatefulWidget {
  const Countdown({Key? key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  static const countdownDuration = Duration(seconds: 10);
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // startTimer();
    reset();
  }

  void reset() {
    setState(() => duration = countdownDuration);
  }

  void subTime() {
    const subSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + subSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => subTime());
  }

  @override
  Widget build(BuildContext context) {
    // method to convert duration to two digits (9 -> 09);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildTimeCard(time: seconds, header: "SECONDS LEFT"),
        RoundedButton(
            text: "START TIMER",
            press: () {
              startTimer();
            }),
        RoundedButton(
            text: "STOP TIMER",
            press: () {
              timer?.cancel();
            }),
        RoundedButton(
            text: "RESET",
            press: () {
              reset();
            }),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 60,
            ),
          ));
}
