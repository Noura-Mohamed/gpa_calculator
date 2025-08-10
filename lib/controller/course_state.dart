import 'package:gba_calculator/models/course_model.dart';

class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoaded extends CourseState {
  final List<CourseModel> courses;
  final List<CourseModel> tempCourses;
  final double? gpa;

  CourseLoaded({
    required this.courses,
    List<CourseModel>? tempCourses,
    this.gpa,
  }) : tempCourses = tempCourses ?? [];
}


class CoursesError extends CourseState {
  final String message;
  CoursesError(this.message);
}
