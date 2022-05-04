import 'dart:html';

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
        width: double.infinity,
        height: size.height,
        color: const Color(0xFFFABBDB));
  }
}
