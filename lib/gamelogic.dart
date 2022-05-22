import 'dart:math';

class GameLogic {
  final options = ['tesoura', 'pedra', 'papel'];

  String takeRandomValue() {
    final _random = new Random();
    var element = options[_random.nextInt(options.length)];
    return element;
  }

  String selectWinner(String player, String app){
    if (player == 'papel' && app == 'papel'){
      return 'Empate';
    }
    else if (player == 'pedra' && app == 'pedra'){
      return 'Empate';
    }
    else if (player == 'tesoura' && app == 'tesoura'){
      return 'Empate';
    }
    else if (player == 'tesoura' && app == 'papel'){
      return 'Você venceu!';
    }
     else if (player == 'tesoura' && app == 'pedra'){
      return 'Você perdeu';
    }
    else if (player == 'pedra' && app == 'papel'){
      return 'Você perdeu';
    }
    else if (player == 'pedra' && app == 'tesoura'){
      return 'Você venceu!';
    }
    else if (player == 'papel' && app == 'tesoura'){
      return 'Você perdeu';
    }
    else if (player == 'papel' && app == 'pedra'){
      return 'Você venceu!';
    }
    return 'Nenhum valor';
  }

  String tratarResultado(String resultado){
    if (resultado == 'Você venceu!'){
      return 'Player_Venceu';
    }
    else if (resultado == 'Você perdeu'){
      return 'App_Venceu';
    }
    return resultado;
  }
}
