import 'package:flutter/material.dart';
import 'package:jokenpo/game.dart';
import 'package:jokenpo/level.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jokenpo'),
        ),
      ),
      body: Level(),
    );
  }
}
