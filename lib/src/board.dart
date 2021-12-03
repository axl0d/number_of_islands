import 'dart:math';

import 'cell.dart';

class Board {
  Board(this._size) : cells = [];

  final int _size;
  final List<Cell> cells;

  List createBoard() {
    final random = Random();
    return List.generate(
      _size,
      (i) => List.generate(
        _size,
        (j) {
          final rand = random.nextInt(2);
          cells.add(
            Cell(x: i, y: j, type: rand == 1 ? CellType.land : CellType.water),
          );
          return rand;
        },
        growable: false,
      ),
      growable: false,
    );
  }

  List updateBoard(List matrix, int x, int y, int index) {
    final cell = matrix[x][y];
    if (cell == 0) {
      matrix[x][y] = 1;
      cells[index] = Cell(x: x, y: y, type: CellType.land);
    }
    if (cell == 1) {
      matrix[x][y] = 0;
      cells[index] = Cell(x: x, y: y, type: CellType.water);
    }
    return matrix;
  }
}
