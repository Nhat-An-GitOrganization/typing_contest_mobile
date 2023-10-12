class Student {
  String? id;
  String? trainingFacility;
  String? email;
  String? createDate;
  int? status;
  String? image;
  Student(
      {this.id,
        this.trainingFacility,
        this.email,
        this.createDate,
        this.image,
        this.status});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainingFacility = json['TrainingFacility'];
    email = json['Email'];
    createDate = json['CreateDate'];
    status = json['Status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['TrainingFacility'] = trainingFacility;
    data['Email'] = email;
    data['CreateDate'] = createDate;
    data['Status'] = status;
    data['image'] = image;
    return data;
  }
}
List<Student> students = [
  Student(
    id: '1',
    trainingFacility: 'ABC University',
    email: 'student1@example.com',
    createDate: '2023-10-11',
    status: 1,
    image: "lib/images/actor_3.png",
  ),
  Student(
    id: '2',
    trainingFacility: 'XYZ College',
    email: 'student2@example.com',
    createDate: '2023-10-12',
    status: 0,
    image: "lib/images/actor_1.png",
  ),
  Student(
    id: '3',
    trainingFacility: 'DEF School',
    email: 'student3@example.com',
    createDate: '2023-10-13',
    status: 1,
    image: "lib/images/actor_2.png",
  ),
];
