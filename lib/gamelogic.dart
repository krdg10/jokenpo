import 'dart:math';

class GameLogic {
  final options = ['tesoura', 'pedra', 'papel'];

  String takeRandomValue(String level, String jogada) {
    if (level == 'Fácil') {
      if (jogada == 'pedra') {
        List temporaryList = List.from(options);
        temporaryList.add('tesoura');
        temporaryList.add('tesoura');
        temporaryList.add('pedra');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'tesoura') {
        List temporaryList = List.from(options);
        temporaryList.add('papel');
        temporaryList.add('papel');
        temporaryList.add('tesoura');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'papel') {
        List temporaryList = List.from(options);
        temporaryList.add('pedra');
        temporaryList.add('pedra');
        temporaryList.add('papel');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      }
    } else if (level == 'Normal') {
      final _random = new Random();
      var element = options[_random.nextInt(options.length)];
      return element;
    } else if (level == 'Difícil') {
      if (jogada == 'pedra') {
        List temporaryList = List.from(options);
        temporaryList.add('papel');
        temporaryList.add('papel');
        temporaryList.add('pedra');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'tesoura') {
        List temporaryList = List.from(options);
        temporaryList.add('pedra');
        temporaryList.add('pedra');
        temporaryList.add('tesoura');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'papel') {
        List temporaryList = List.from(options);
        temporaryList.add('tesoura');
        temporaryList.add('tesoura');
        temporaryList.add('papel');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      }
    } else if (level == 'Impossível') {
      if (jogada == 'pedra') {
        List temporaryList = List.from(options);
        temporaryList.remove('tesoura');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'tesoura') {
        List temporaryList = List.from(options);
        temporaryList.remove('papel');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      } else if (jogada == 'papel') {
        List temporaryList = List.from(options);
        temporaryList.remove('pedra');
        final _random = new Random();
        var element = temporaryList[_random.nextInt(temporaryList.length)];
        return element;
      }
    }
    return 'pedra';
  }

  String selectWinner(String player, String app) {
    if (player == 'papel' && app == 'papel') {
      return 'Empate';
    } else if (player == 'pedra' && app == 'pedra') {
      return 'Empate';
    } else if (player == 'tesoura' && app == 'tesoura') {
      return 'Empate';
    } else if (player == 'tesoura' && app == 'papel') {
      return 'Você venceu!';
    } else if (player == 'tesoura' && app == 'pedra') {
      return 'Você perdeu';
    } else if (player == 'pedra' && app == 'papel') {
      return 'Você perdeu';
    } else if (player == 'pedra' && app == 'tesoura') {
      return 'Você venceu!';
    } else if (player == 'papel' && app == 'tesoura') {
      return 'Você perdeu';
    } else if (player == 'papel' && app == 'pedra') {
      return 'Você venceu!';
    }
    return 'Nenhum valor';
  }

  String tratarResultado(String resultado) {
    if (resultado == 'Você venceu!') {
      return 'Player_Venceu';
    } else if (resultado == 'Você perdeu') {
      return 'App_Venceu';
    }
    return resultado;
  }
}
