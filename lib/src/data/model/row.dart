import 'package:tic_tac_toe/src/data/model/move.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';

class GamePlayRow {
  final Map<int, Player?> columns = {0: null, 1: null, 2 : null};

  GamePlayRow();

  // checking if this row has null(didn't received any input yet) in any of its column,
  // meaning, game is not over yet.
  bool get isAnyColumnHasValidInputLeft =>
      columns.values.where((player) => player == null).isNotEmpty;

  void setMove(Move move) {
    columns[move.column] = move.player;
  }
}
