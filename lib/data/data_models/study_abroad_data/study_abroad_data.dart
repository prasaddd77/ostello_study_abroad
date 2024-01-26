import 'package:ostello_task/data/data_models/study_abroad_data/create_study_abroad_student_model.dart';

class StudyAbroadData {
  static CreateStudyAbroadStudentModel studentModel = CreateStudyAbroadStudentModel();

  static void updateCountry(String country) {
    studentModel.country = country;
  }

  static void updateBudget(String budget) {
    studentModel.costOfStudy = budget;
  }

  static void updateDegree(String degree) {
    studentModel.degreeDesired = degree;
  }

  static void updateMajorSubject(String majorSubject) {
    studentModel.preferredFieldOfStudy = majorSubject;
  }

  static void updateScholarship(bool scholarship) {
    studentModel.scholarship = scholarship;
  }

  static void updateStudentId() {
    studentModel.studentId = '009bf53a-7b7d-4385-b421-baa9524348f5';
  }

  static Map<String, dynamic> getJsonData() {
    return studentModel.toJson();
  }
}
