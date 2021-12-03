const rowNbr = [-1, -1, -1, 0, 0, 1, 1, 1];
const colNbr = [-1, 0, 1, -1, 1, -1, 0, 1];

class NumberOfIslands {
  const NumberOfIslands(this.size);

  final int size;

  bool isSafe(List matrix, int row, int col, List visited) {
    return (row >= 0) &&
        (row < size) &&
        (col >= 0) &&
        (col < size) &&
        (matrix[row][col] == 1 && !visited[row][col]);
  }

  void dfs(List matrix, int row, int col, List visited) {
    visited[row][col] = true;
    for (int k = 0; k < 8; ++k) {
      if (isSafe(matrix, row + rowNbr[k], col + colNbr[k], visited)) {
        dfs(matrix, row + rowNbr[k], col + colNbr[k], visited);
      }
    }
  }

  List createVisited() {
    return List.generate(
      size,
      (i) => List.generate(
        size,
        (j) => false,
        growable: false,
      ),
      growable: false,
    );
  }

  int countIslands(List matrix) {
    var visited = createVisited();
    int count = 0;
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if (matrix[i][j] == 1 && !visited[i][j]) {
          dfs(matrix, i, j, visited);
          ++count;
        }
      }
    }
    return count;
  }
}
