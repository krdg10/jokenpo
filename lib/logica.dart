import 'dart:math';

class GameLogic {
  final options = ['tesoura', 'pedra', 'papel'];

  String takeRandomValue(String level, String jogada) {
    if (level == 'Fácil') {
      if (jogada == 'pedra') {
        return addVetorNivelFacilOuDificil('tesoura', 'pedra');
      } else if (jogada == 'tesoura') {
        return addVetorNivelFacilOuDificil('papel', 'tesoura');
      } else if (jogada == 'papel') {
        return addVetorNivelFacilOuDificil('pedra', 'papel');
      }
    } else if (level == 'Normal') {
      final _random = new Random();
      var element = options[_random.nextInt(options.length)];
      return element;
    } else if (level == 'Difícil') {
      if (jogada == 'pedra') {
        return addVetorNivelFacilOuDificil('papel', 'pedra');
      } else if (jogada == 'tesoura') {
        return addVetorNivelFacilOuDificil('pedra', 'tesoura');
      } else if (jogada == 'papel') {
        return addVetorNivelFacilOuDificil('tesoura', 'papel');
      }
    } else if (level == 'Impossível') {
      if (jogada == 'pedra') {
        return removerParaImpossivel('tesoura');
      } else if (jogada == 'tesoura') {
        return removerParaImpossivel('papel');
      } else if (jogada == 'papel') {
        return removerParaImpossivel('pedra');
      }
    }
    return 'pedra';
  }

  removerParaImpossivel(String remove) {
    List temporaryList = List.from(options);
    temporaryList.remove(remove);
    final _random = new Random();
    var element = temporaryList[_random.nextInt(temporaryList.length)];
    return element;
  }

  addVetorNivelFacilOuDificil(String addDois, String addUm) {
    List temporaryList = List.from(options);
    temporaryList.add(addDois);
    temporaryList.add(addDois);
    temporaryList.add(addUm);
    final _random = new Random();
    var element = temporaryList[_random.nextInt(temporaryList.length)];
    return element;
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
//adicionando