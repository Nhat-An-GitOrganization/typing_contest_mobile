class Contest {
  final int id;
  final String title, description, image, dateStart, dateEnd;
  final List<String> genra;
  final List<Map> orga;

  Contest(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateStart,
      required this.dateEnd,
      required this.genra,
      required this.orga,
      required this.image});
}

List<Contest> contest = [
  Contest(
    id: 1,
    title: 'TypingBee Spring 2023',
    description:
        'Thời gian thành lập và đi vào hoạt động chưa nhiều, mới được một năm, nhưng nhiều Ban Chỉ đạo cấp tỉnh về phòng, chống tham nhũng, tiêu cực đã nỗ lực lớn, quyết tâm cao, có những kinh nghiệm quý, cách làm hay cần phát huy, nhân rộng; nhưng cũng có một số nơi hoạt động còn có những khó khăn, vướng mắc cần tháo gỡ.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "Special Characters"],
    image: 'lib/images/blue.jpg',
    orga: [
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "lib/images/actor_3.png",
      },
    ],
  ),
  Contest(
    id: 2,
    title: 'Typing Contest 2',
    description:
        'Thời gian thành lập và đi vào hoạt động chưa nhiều, mới được một năm, nhưng nhiều Ban Chỉ đạo cấp tỉnh về phòng, chống tham nhũng, tiêu cực đã nỗ lực lớn, quyết tâm cao, có những kinh nghiệm quý, cách làm hay cần phát huy, nhân rộng; nhưng cũng có một số nơi hoạt động còn có những khó khăn, vướng mắc cần tháo gỡ.',
    dateStart: '10-02-2023',
    dateEnd: '15-03-2023',
    genra: ["BackSpace", "No Special Characters"],
    image: 'lib/images/anLogo.jpg',
    orga: [
      {
        "orginalName": "James Mangold",
        "movieName": "Directors",
        "image": "lib/images/actor_1.png",
      },
    ],
  ),
  Contest(
    id: 3,
    title: 'Typing Contest 3',
    description:
        'Thời gian thành lập và đi vào hoạt động chưa nhiều, mới được một năm, nhưng nhiều Ban Chỉ đạo cấp tỉnh về phòng, chống tham nhũng, tiêu cực đã nỗ lực lớn, quyết tâm cao, có những kinh nghiệm quý, cách làm hay cần phát huy, nhân rộng; nhưng cũng có một số nơi hoạt động còn có những khó khăn, vướng mắc cần tháo gỡ.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "No Special Characters"],
    image: 'lib/images/background.png',
    orga: [
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "lib/images/actor_2.png",
      },
    ],
  ),
  Contest(
    id: 4,
    title: 'Typing Contest 1',
    description:
        'Thời gian thành lập và đi vào hoạt động chưa nhiều, mới được một năm, nhưng nhiều Ban Chỉ đạo cấp tỉnh về phòng, chống tham nhũng, tiêu cực đã nỗ lực lớn, quyết tâm cao, có những kinh nghiệm quý, cách làm hay cần phát huy, nhân rộng; nhưng cũng có một số nơi hoạt động còn có những khó khăn, vướng mắc cần tháo gỡ.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "Special Characters"],
    image: 'lib/images/blue.jpg',
    orga: [
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "lib/images/actor_3.png",
      },
    ],
  ),
];
