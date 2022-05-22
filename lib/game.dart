import 'package:flutter/material.dart';
import 'package:jokenpo/gamelogic.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String imagemEscolhaApp = 'circulo.png';
  String resultado = '';
  String escolhaApp = '';
  GameLogic gamelogic = GameLogic();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                'Escolha do App',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset(
              imagemEscolhaApp,
              width: 250,
              height: 250,
            ),
          ),
          Container(
            child: Text(
              resultado,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  botao(context, 'tesoura'),
                  botao(context, 'pedra'),
                  botao(context, 'papel'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector botao(BuildContext context, String jogada) {
    return GestureDetector(
      onTap: () {
        modal(context);
        setState(() {
          escolhaApp = gamelogic.takeRandomValue();
          imagemEscolhaApp = escolhaApp + '.png';
          print(imagemEscolhaApp);
          resultado = gamelogic.selectWinner(jogada, escolhaApp);
        });
      },
      child: Image.asset(
        jogada + '.png',
        width: 125,
        height: 125,
      ),
    );
  }

  Future<void> modal(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Container(
                    child: Text(
                      resultado,
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 39, 71),
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  gamelogic.tratarResultado(resultado) + '.png',
                  width: 250,
                  height: 250,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
