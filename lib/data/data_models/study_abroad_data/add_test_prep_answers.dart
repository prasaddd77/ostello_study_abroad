class AnswerModel {
  String studentId;
  Map<String, dynamic> answers;

  AnswerModel({
    required this.studentId,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      "studentId": studentId,
      "answers": answers,
    };
  }

  fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    answers = json['answers'];
  }
}
