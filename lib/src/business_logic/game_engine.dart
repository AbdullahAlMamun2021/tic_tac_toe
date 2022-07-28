import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/data/model/move.dart';
import 'package:tic_tac_toe/src/data/model/row.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';

///
///board-> 0 1 2
///row0 -> X X X
///row1 -> X X x
///row2 -> X X X

///board -> [row0, row1, row2]

class GameEngine extends ChangeNotifier {
//# properties of gameEngine

  List<GamePlayRow> gameBoard =
      List<GamePlayRow>.filled(3, GamePlayRow(), growable: false);

  late GameResult gameResult;

  Player? currentPlayer;
//#__________________________________________________________

//# functionalities and behaviors of the gameEngine

  void startGame() {
    // set [gameResult] to [GameResult.notStartedYet]
    gameResult = GameResult.notStartedYet;

    // reset [gameBoard] via calling [resetGame()] function
    resetGame();

    // switch the value of [currentPlayer] to [Player.one] via calling [switchPlayer()]
    switchPlayer();
  }

  void inputMove(Move move) {
    // validate the [move] via calling the [isThisMoveValid(Move move)] function
    if (isThisMoveValid(move)) {
      // if valid, input the [move] to [gameBoard]
      gameBoard[move.row].columns[move.column] = move.player;
      notifyListeners();

      // switch [currentPlayer] as this move is already in [gameBoard] via calling the [switchPlayer] method
      switchPlayer();

      // evaluate the [gameResult] via calling [evaluateGame] method
      evaluateGame();
    } else {
      // throw an exception as invalid move has occurred
      throw ArgumentError(
          "this move is not valid, please provide a valid move");
    }
  }

  bool isThisMoveValid(Move move) {
    // is [currentPlayer] and [move.player] is the same player
    bool isSamePlayer = currentPlayer == move.player;

    // is targeted block is available to input
    bool isAvailableToInput =
        getPlayerFromRowAndColumn(move.row, move.column) == null;

    return isSamePlayer && isAvailableToInput;
  }

  void switchPlayer() {
    // switch [currentPlayer]
    if(currentPlayer==null) {
      currentPlayer = Player.one;
    } else {
      currentPlayer = currentPlayer == Player.one ? Player.two : Player.one;
    }
    notifyListeners();
  }

  void evaluateGame() {
    //check row 1 for player 1
    if (getPlayerFromRowAndColumn(0, 0) == Player.one &&
        getPlayerFromRowAndColumn(0, 1) == Player.one &&
        getPlayerFromRowAndColumn(0, 2) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check row 1 for player 2
    else if (getPlayerFromRowAndColumn(0, 0) == Player.two &&
        getPlayerFromRowAndColumn(0, 1) == Player.two &&
        getPlayerFromRowAndColumn(0, 2) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }

    //check row 2 for player 1
    else if (getPlayerFromRowAndColumn(1, 0) == Player.one &&
        getPlayerFromRowAndColumn(1, 1) == Player.one &&
        getPlayerFromRowAndColumn(1, 2) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check row 2 for player 2
    else if (getPlayerFromRowAndColumn(1, 0) == Player.two &&
        getPlayerFromRowAndColumn(1, 1) == Player.two &&
        getPlayerFromRowAndColumn(1, 2) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }
    //check row 3 for player 1
    else if (getPlayerFromRowAndColumn(2, 0) == Player.one &&
        getPlayerFromRowAndColumn(2, 1) == Player.one &&
        getPlayerFromRowAndColumn(2, 2) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check row 3 for player 2
    else if (getPlayerFromRowAndColumn(2, 0) == Player.two &&
        getPlayerFromRowAndColumn(2, 1) == Player.two &&
        getPlayerFromRowAndColumn(2, 2) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }

    //check column 1 for player 1
    else if (getPlayerFromRowAndColumn(0, 0) == Player.one &&
        getPlayerFromRowAndColumn(1, 0) == Player.one &&
        getPlayerFromRowAndColumn(2, 0) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check column 1 for player 2
    else if (getPlayerFromRowAndColumn(0, 0) == Player.two &&
        getPlayerFromRowAndColumn(1, 0) == Player.two &&
        getPlayerFromRowAndColumn(2, 0) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }
    //check column 2 for player 1
    else if (getPlayerFromRowAndColumn(0, 1) == Player.one &&
        getPlayerFromRowAndColumn(1, 1) == Player.one &&
        getPlayerFromRowAndColumn(2, 1) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check column 2 for player 2
    else if (getPlayerFromRowAndColumn(0, 1) == Player.two &&
        getPlayerFromRowAndColumn(1, 1) == Player.two &&
        getPlayerFromRowAndColumn(2, 1) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }
    //check column 3 for player 1
    else if (getPlayerFromRowAndColumn(0, 2) == Player.one &&
        getPlayerFromRowAndColumn(1, 2) == Player.one &&
        getPlayerFromRowAndColumn(2, 2) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check column 3 for player 2
    else if (getPlayerFromRowAndColumn(0, 2) == Player.two &&
        getPlayerFromRowAndColumn(1, 2) == Player.two &&
        getPlayerFromRowAndColumn(2, 2) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }
    //check diagonally RTL 1 for player 1
    else if (getPlayerFromRowAndColumn(0, 0) == Player.one &&
        getPlayerFromRowAndColumn(1, 1) == Player.one &&
        getPlayerFromRowAndColumn(2, 2) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check diagonally RTL for player 2
    else if (getPlayerFromRowAndColumn(0, 0) == Player.two &&
        getPlayerFromRowAndColumn(1, 1) == Player.two &&
        getPlayerFromRowAndColumn(2, 2) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    }
    //check diagonally LTR for player 1
    else if (getPlayerFromRowAndColumn(0, 2) == Player.one &&
        getPlayerFromRowAndColumn(1, 1) == Player.one &&
        getPlayerFromRowAndColumn(2, 0) == Player.one) {
      gameResult = GameResult.player1Won;
      notifyListeners();
    }
    //check diagonally LTR for player 2
    else if (getPlayerFromRowAndColumn(0, 2) == Player.two &&
        getPlayerFromRowAndColumn(1, 1) == Player.two &&
        getPlayerFromRowAndColumn(2, 0) == Player.two) {
      gameResult = GameResult.player2Won;
      notifyListeners();
    } else {
      // engine found no winner, so the game must be drawn or didn't finish yet

      if (isAnyMoveLeft) {
        gameResult = GameResult.ongoning;
      } else {
        gameResult = GameResult.draw;
      }
      notifyListeners();
    }
  }

  bool get isAnyMoveLeft =>
      gameBoard[0].isAnyColumnHasValidInputLeft ||
      gameBoard[1].isAnyColumnHasValidInputLeft ||
      gameBoard[2].isAnyColumnHasValidInputLeft;

  void resetGame() {
    // reset [gameBoard]

    // this approach will not work, because [gameBoard] is declared as final,
    // please remove the final keyword in the declaration to reset this way.
    gameBoard = List<GamePlayRow>.filled(3, GamePlayRow(), growable: false);
  }

//#__________________________________________________________________________________

//# game evaluation
  Player? getPlayerFromRowAndColumn(int row, int column) =>
      gameBoard[row].columns[column];
}
