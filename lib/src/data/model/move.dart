import 'package:tic_tac_toe/src/utils/enums.dart';

class Move {
  final Player player;
  final int row;
  final int column;

  Move({required this.player, required this.row, required this.column});
}
