enum CellType { land, water }

class Cell {
  final int x;
  final int y;
  final CellType type;

  Cell({
    required this.x,
    required this.y,
    required this.type,
  });

  @override
  String toString() => 'Cell -> x:$x, y: $y, type: $type';
}
