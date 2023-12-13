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
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "Special Characters"],
    image: 'lib/images/background.png',
    orga: [
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "lib/images/ava_2.png",
      },
    ],
  ),
  Contest(
    id: 2,
    title: 'TypingBee Summer 2023',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-03-2023',
    genra: ["BackSpace", "No Special Characters"],
    image: 'lib/images/2.jpg',
    orga: [
      {
        "orginalName": "James Mangold",
        "movieName": "Directors",
        "image": "lib/images/ava_3.png",
      },
    ],
  ),
  Contest(
    id: 3,
    title: 'TypingBee Autumn 2023',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "No Special Characters"],
    image: 'lib/images/background.png',
    orga: [
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "lib/images/ava_1.jpg",
      },
    ],
  ),
  Contest(
    id: 4,
    title: 'TypingBee Winter 2023',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-03-2023',
    genra: ["BackSpace", "No Special Characters"],
    image: 'lib/images/1.jpg',
    orga: [
      {
        "orginalName": "James Mangold",
        "movieName": "Directors",
        "image": "lib/images/ava_4.png",
      },
    ],
  ),
  Contest(
    id: 5,
    title: 'Typing Contest 2',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-03-2023',
    genra: ["BackSpace", "No Special Characters"],
    image: 'lib/images/3.jpg',
    orga: [
      {
        "orginalName": "James Mangold",
        "movieName": "Directors",
        "image": "lib/images/ava_5.png",
      },
    ],
  ),
  Contest(
    id: 6,
    title: 'Typing Contest 2',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-03-2023',
    genra: ["BackSpace", "No Special Characters"],
    image: 'lib/images/4.jpg',
    orga: [
      {
        "orginalName": "James Mangold",
        "movieName": "Directors",
        "image": "lib/images/ava_6.png",
      },
    ],
  ),
  Contest(
    id: 7,
    title: 'Typing Contest 1',
    description:
        'Cuộc thi ANH HÙNG BÀN PHÍM - TYPING BEES 🐝  là 1 sự kết hợp hoàn hảo giữa bộ môn Ứng dụng phần mềm và Bộ môn Tiếng Anh tạo ra dành cho hàng ngàn sinh viên FPoly, Melbourne và BTEC.',
    dateStart: '10-02-2023',
    dateEnd: '15-02-2023',
    genra: ["No BackSpace", "Special Characters"],
    image: 'lib/images/blue.jpg',
    orga: [
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "lib/images/ava_7.png",
      },
    ],
  ),
];
