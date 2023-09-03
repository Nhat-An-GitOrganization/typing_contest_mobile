class Contest {
  final int id;
  final String title, description, image;

  Contest(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});
}

List<Contest> contest = [
  Contest(
    id: 1,
    title: 'Typing Contest 1',
    description: 'Thi đánh máy',
    image: 'lib/images/blue.jpg',
  ),
  Contest(
    id: 2,
    title: 'Typing Contest 2',
    description: 'Thi đánh máy 2',
    image: 'lib/images/anLogo.jpg',
  ),
  Contest(
    id: 3,
    title: 'Typing Contest 3',
    description: 'Thi đánh máy 3',
    image: 'lib/images/background.png',
  ),
  // Contest(
  //   id: 4,
  //   title: 'Typing Contest 4',
  //   description: 'Thi đánh máy 4',
  //   image: 'lib/images/anLogo.jpg',
  // ),
];
