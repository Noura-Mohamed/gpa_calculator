import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gba_calculator/controller/course_state.dart';
import 'package:gba_calculator/models/course_model.dart';
import 'package:hive/hive.dart';

class CoursesCubit extends Cubit<CourseState> {
  final Box<CourseModel> courseBox;
  final Box gpaBox;

  List<CourseModel> tempCourses = [];

  CoursesCubit({required this.courseBox, required this.gpaBox})
    : super(CourseInitial()) {
    loadCourses();
  }

  void loadCourses() {
    final courses = courseBox.values.toList();
    emit(CourseLoaded(courses: courses, tempCourses: tempCourses));
  }

  void addTempCourse() {
    tempCourses.add(CourseModel(courseName: '', hourse: 0, grade: ''));
    emit(
      CourseLoaded(
        courses: courseBox.values.toList(),
        tempCourses: tempCourses,
      ),
    );
  }

  void updateTempCourse(int index, {String? name, int? hours, String? grade}) {
    final course = tempCourses[index];
    tempCourses[index] = CourseModel(
      courseName: name ?? course.courseName,
      hourse: hours ?? course.hourse,
      grade: grade ?? course.grade,
    );
    loadCourses();
  }

  void calculateGPA() {
    final courses = courseBox.values.toList();
    if (courses.isEmpty) {
      emit(CoursesError('No courses to calculate GPA.'));
      return;
    }

    double totalPoints = 0;
    int totalHours = 0;

    for (var course in courses) {
      final points = gradeToPoints(course.grade);
      totalPoints += points * course.hourse;
      totalHours += course.hourse;
    }

    final gpa = totalPoints / totalHours;
    gpaBox.put('last_gpa', gpa);

    emit(CourseLoaded(courses: courses, tempCourses: tempCourses, gpa: gpa));
  }

  double gradeToPoints(String grade) {
    switch (grade.toUpperCase()) {
      case 'A+':
        return 4.0;
      case 'A':
        return 3.7;
      case 'A-':
        return 3.4;
      case 'B+':
        return 3.2;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.8;
      case 'C+':
        return 2.6;
      case 'C':
        return 2.4;
      case 'C-':
        return 2.2;
      case 'D+':
        return 2.0;
      case 'D':
        return 1.5;
      case 'D-':
        return 1.0;
      default:
        return 0.0;
    }
  }

  void resetCourses() {
    tempCourses.clear();
    if (state is CourseLoaded) {
      final currentState = state as CourseLoaded;
      emit(
        CourseLoaded(
          courses: currentState.courses,
          tempCourses: tempCourses,
          gpa: null,
        ),
      );
    }
  }

  String semesterName = '';

  void updateSemesterName(String name) {
    semesterName = name;
    gpaBox.put('last_semester', name);
    if (state is CourseLoaded) {
      final currentState = state as CourseLoaded;
      emit(
        CourseLoaded(
          courses: currentState.courses,
          tempCourses: currentState.tempCourses,
          gpa: currentState.gpa,
        ),
      );
    }
  }
}
