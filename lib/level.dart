import 'package:flutter/material.dart';
import 'package:jokenpo/game.dart';

class Level extends StatelessWidget {
  const Level({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Image.asset(
              'Home.png',
              height: 200,
            ),
          ),
          Botao(context, 'Fácil'),
          Botao(context, 'Normal'),
          Botao(context, 'Difícil'),
          Botao(context, 'Impossível'),
        ],
      ),
    );
  }

  GestureDetector Botao(BuildContext context, String texto) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Game(
              level: texto,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
        ),
        child: ListTile(
          style: ListTileStyle.drawer,
          title: Center(
            child: Text(
              texto,
            ),
          ),
        ),
      ),
    );
  }
}
