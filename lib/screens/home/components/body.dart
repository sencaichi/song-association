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

    startTimer();
    reset();
  }

  void reset() {
    setState(() => duration = countdownDuration);
  }

  void subTime() {
    const subSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + subSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => subTime());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: buildTime()),
      );

  Widget buildTime() {
    // method to convert duration to two digits (9 -> 09);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: seconds, header: 'SECONDS LEFT'),
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
              fontSize: 72,
            ),
          ));
}
