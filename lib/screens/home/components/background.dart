import 'package:flutter/material.dart';
import 'package:song_association/screens/home/components/background.dart';
import 'package:song_association/components/rounded_botton.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        color: const Color(0xFFFABBDB),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width,
              )),
          child,
        ]));
  }
}
