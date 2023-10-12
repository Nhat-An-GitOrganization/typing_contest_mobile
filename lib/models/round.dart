class RoundContest {
  String? id;
  String? idContest;
  String? name;
  String? nameContest;
  String? description;
  String? imageUrl;
  int? timeLimit;
  int? maxAccess;
  int? availability;
  bool? isDisableBackspace;
  bool? isHavingSpecialChar;
  String? totalTime;
  String? startTime;
  String? startTimeContest;
  String? endTime;
  String? endTimeContest;
  String? createdDate;
  String? createdBy;
  String? modifiedDate;
  String? modifiedBy;
  String? deletedDate;
  String? deletedBy;
  int? status;
  bool? isFinal;

  RoundContest(
      {this.id,
        this.idContest,
        this.name,
        this.nameContest,
        this.description,
        this.imageUrl,
        this.timeLimit,
        this.maxAccess,
        this.availability,
        this.isDisableBackspace,
        this.isHavingSpecialChar,
        this.totalTime,
        this.startTime,
        this.startTimeContest,
        this.endTime,
        this.endTimeContest,
        this.createdDate,
        this.createdBy,
        this.modifiedDate,
        this.modifiedBy,
        this.deletedDate,
        this.deletedBy,
        this.status,
        this.isFinal});

  RoundContest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idContest = json['idContest'];
    name = json['name'];
    nameContest = json['nameContest'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    timeLimit = json['timeLimit'];
    maxAccess = json['maxAccess'];
    availability = json['availability'];
    isDisableBackspace = json['isDisableBackspace'];
    isHavingSpecialChar = json['isHavingSpecialChar'];
    totalTime = json['totalTime'];
    startTime = json['startTime'];
    startTimeContest = json['startTimeContest'];
    endTime = json['endTime'];
    endTimeContest = json['endTimeContest'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    modifiedDate = json['modifiedDate'];
    modifiedBy = json['modifiedBy'];
    deletedDate = json['deletedDate'];
    deletedBy = json['deletedBy'];
    status = json['status'];
    isFinal = json['isFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idContest'] =idContest;
    data['name'] = name;
    data['nameContest'] = nameContest;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['timeLimit'] = timeLimit;
    data['maxAccess'] = maxAccess;
    data['availability'] = availability;
    data['isDisableBackspace'] = isDisableBackspace;
    data['isHavingSpecialChar'] = isHavingSpecialChar;
    data['totalTime'] = totalTime;
    data['startTime'] = startTime;
    data['startTimeContest'] = startTimeContest;
    data['endTime'] = endTime;
    data['endTimeContest'] = endTimeContest;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['modifiedDate'] = modifiedDate;
    data['modifiedBy'] = modifiedBy;
    data['deletedDate'] = deletedDate;
    data['deletedBy'] = deletedBy;
    data['status'] = status;
    data['isFinal'] = isFinal;
    return data;
  }
}