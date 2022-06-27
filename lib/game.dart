import 'package:flutter/material.dart';
import 'package:jokenpo/logica.dart';

class Game extends StatefulWidget {
  final String level;
  const Game({Key? key, required this.level}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String imagemEscolhaApp = 'circulo.png';
  String resultado = '';
  String escolhaApp = '';
  int winApp = 0;
  int winPlayer = 0;
  GameLogic gamelogic = GameLogic();
  List imagensApp = ['circulo.png', 'x.png', 'circulo.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jokenpo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 55.0,
                  right: 55.0,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Você',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'App',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  //itemCount: 3,
                  itemCount: imagensApp.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Image.asset(
                        imagensApp[index],
                      ),
                    );
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text Texto(String texto, int numeroDePontos) {
    if (texto == 'Placar') {
      return Text(
        texto,
        style: TextStyle(
          color: Color.fromARGB(255, 42, 48, 58),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return Text(
        texto + ' ' + numeroDePontos.toString(),
        style: TextStyle(
          color: Color.fromARGB(255, 42, 48, 58),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }

  GestureDetector botao(BuildContext context, String jogada) {
    return GestureDetector(
      onTap: () {
        modal(context);
        setState(
          () {
            escolhaApp = gamelogic.takeRandomValue(widget.level, jogada);
            imagensApp[2] = escolhaApp + '.png';
            imagensApp[0] = jogada + '.png';
            resultado = gamelogic.selectWinner(jogada, escolhaApp);
            if (resultado == "Você venceu!") {
              winPlayer = winPlayer + 1;
            } else if (resultado == "Você perdeu") {
              winApp = winApp + 1;
            }
          },
        );
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
