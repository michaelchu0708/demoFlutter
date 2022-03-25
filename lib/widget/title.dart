import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'To-Do List',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(249, 0, 37, 248),
        fontSize: 50,
        fontWeight: FontWeight.w100,
        fontFamily: 'Helvetica Neue',
      ),
    );
  }
}
