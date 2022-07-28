import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/src/business_logic/game_engine.dart';
import 'package:tic_tac_toe/src/data/model/move.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';

void main() {
  test("Player 1 will won", () {
    final GameEngine engine = GameEngine();

    // player 1 : X
    // player 2 : O

    // step-1: start the game
    engine.startGame();
    // # -> 0 1 2
    // 0 -> . . .
    // 1 -> . . .
    // 2 -> . . .

    // step-2: X : 1, 0
    engine.inputMove(Move(player: Player.one, row: 1, column: 0));
    expect(engine.currentPlayer, Player.two);
    expect(engine.gameResult, GameResult.ongoning);
    expect(engine.getPlayerFromRowAndColumn(1, 0), isNotNull);
    expect(engine.getPlayerFromRowAndColumn(1, 0), Player.one);
    // # -> 0 1 2
    // 0 -> . . .
    // 1 -> X . .
    // 2 -> . . .

    // # -> 0 1 2
    // 0 -> . . .
    // 1 -> X O .
    // 2 -> . . .
    // step-3: O : 1,1

    // # -> 0 1 2
    // 0 -> X . .
    // 1 -> X O .
    // 2 -> . . .
    // step-4: X : 0,0

    // # -> 0 1 2
    // 0 -> X . .
    // 1 -> X O O
    // 2 -> . . .
    // step-5: O : 1,2

    // # -> 0 1 2
    // 0 -> X . .
    // 1 -> X O O
    // 2 -> X . .
    // step-6: X : 2,0
  });
}
