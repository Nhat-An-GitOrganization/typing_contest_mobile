class ContestDetail {
  int? stt;
  String? id;
  String? idOrganizer;
  String? name;
  String? description;
  String? imageUrl;
  String? startTime;
  String? endTime;
  int? status;
  String? isFinal;

  ContestDetail(
      {this.stt,
        this.id,
        this.idOrganizer,
        this.name,
        this.description,
        this.imageUrl,
        this.startTime,
        this.endTime,
        this.status,
        this.isFinal});

  ContestDetail.fromJson(Map<String, dynamic> json) {
    stt = json['stt'];
    id = json['id'];
    idOrganizer = json['idOrganizer'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    status = json['status'];
    isFinal = json['isFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stt'] = this.stt;
    data['id'] = this.id;
    data['idOrganizer'] = this.idOrganizer;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['isFinal'] = this.isFinal;
    return data;
  }
}