import 'package:number_of_islands/number_of_islands.dart';

void main() {
  final size = 3;
  final board = Board(size);
  final created = board.createBoard();
  print(created);
  // print(board.cells);
  final noi = NumberOfIslands(size);
  print(noi.countIslands(created));
  final updated = board.updateBoard(created, 1, 1, 4);
  print(updated);
  print(noi.countIslands(updated));
}
