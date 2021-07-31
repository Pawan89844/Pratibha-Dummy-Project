class Data {
  final String? id;
  final String? image;

  const Data(this.id, this.image);
}

const MY_DATA = const [
  Data('A0', 'assets/Sliders/n1.png'),
  Data('A1', 'assets/Sliders/o1.png'),
  Data('A2', 'assets/Sliders/p1.png'),
];

class GridData {
  final String id;
  final String image;
  final String text;

  const GridData(this.id, this.image, this.text);
}

const GRID_DATA = const [
  GridData('A0', 'assets/images/1.png', '3 Years UPSC Question Papers'),
  GridData('A1', 'assets/images/2.png', 'Previous 25 Year Question Papers'),
  GridData('A2', 'assets/images/3.png', 'All India Mock Tests'),
  GridData('A3', 'assets/images/4.png', 'Review Bookmarks'),
  GridData('A4', 'assets/images/5.png', 'Attempt incorrect Questions'),
  GridData('A5', 'assets/images/6.png', 'Performance summary'),
  GridData('A6', 'assets/images/7.png', 'Critical Thinking'),
  GridData('A7', 'assets/images/8.png', 'Review Progress'),
];
