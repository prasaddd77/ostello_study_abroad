class CreateStudyAbroadStudentModel {
  String? country;
  String? degreeDesired;
  String? preferredFieldOfStudy;
  String? costOfStudy;
  bool? scholarship;
  String? studentId;

  CreateStudyAbroadStudentModel(
      {this.country,
        this.degreeDesired,
        this.preferredFieldOfStudy,
        this.costOfStudy,
        this.scholarship,
        this.studentId});

  CreateStudyAbroadStudentModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    degreeDesired = json['degreeDesired'];
    preferredFieldOfStudy = json['preferredFieldOfStudy'];
    costOfStudy = json['costOfStudy'];
    scholarship = json['scholarship'];
    studentId = json['studentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['degreeDesired'] = degreeDesired;
    data['preferredFieldOfStudy'] = preferredFieldOfStudy;
    data['costOfStudy'] = costOfStudy;
    data['scholarship'] = scholarship;
    data['studentId'] = studentId;
    return data;
  }
}