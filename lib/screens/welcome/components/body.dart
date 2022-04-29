import 'package:flutter/material.dart';
import 'package:song_association/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "READY TO PLAY?",
              style:
            ),

          ],)
        )
    )
  }
}
