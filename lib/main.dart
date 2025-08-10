import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gba_calculator/controller/courses_cubit.dart';
import 'package:gba_calculator/models/course_model.dart';
import 'package:gba_calculator/views/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CourseModelAdapter());
  var courseBox = await Hive.openBox<CourseModel>('course_box');
  var gpaBox = await Hive.openBox('gpa_box');
  runApp(
    BlocProvider(
      create: (_) => CoursesCubit(courseBox: courseBox, gpaBox: gpaBox),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GpaCalculator(),
      ),
    ),
  );
}

class GpaCalculator extends StatelessWidget {
  const GpaCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
