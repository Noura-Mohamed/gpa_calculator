import 'package:hive/hive.dart';

part 'course_model.g.dart';

@HiveType(typeId: 0)
class CourseModel extends HiveObject {

  @HiveField(0)
  final String courseName;
  @HiveField(1)
  final int hourse;
  @HiveField(2)
  final String grade;

  CourseModel({required this.courseName, required this.hourse, required this.grade});
}
