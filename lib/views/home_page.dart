import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gba_calculator/controller/course_state.dart';
import 'package:gba_calculator/controller/courses_cubit.dart';
import 'package:gba_calculator/views/gpa_result.dart';
import 'package:gba_calculator/widgets/add_course.dart';
import 'package:gba_calculator/widgets/calculate_button.dart';
import 'package:gba_calculator/widgets/grade_button.dart';
import 'package:gba_calculator/widgets/text_field_input.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'GPA Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<CoursesCubit, CourseState>(
            listener: (context, state) {
              if (state is CourseLoaded && state.gpa != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GpaResultPage(),
                  ),
                );
              }
              if(state is CoursesError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is CourseLoaded) {
                final cubit = context.read<CoursesCubit>();
                return Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Semester Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 237, 209, 243),
                      ),
                      onChanged: (val) {
                        cubit.updateSemesterName(val);
                      },
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.tempCourses.length,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Expanded(
                                child: TextFieldInput(
                                  text: 'Course name',
                                  onChanged: (val) {
                                    cubit.updateTempCourse(i, name: val);
                                  },
                                ),
                              ),
                              Expanded(
                                child: TextFieldInput(
                                  text: 'Hours',
                                  onChanged: (val) {
                                    final hours = int.tryParse(val) ?? 0;
                                    cubit.updateTempCourse(i, hours: hours);
                                  },
                                ),
                              ),
                              Expanded(
                                child: GradeButton(
                                  onGradeSelected: (grade) {
                                    cubit.updateTempCourse(i, grade: grade);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    AddCourse(
                      onPressed: () {
                        cubit.addTempCourse();
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CalculateButton(
                            onPressed: () {
                              cubit.calculateGPA();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              cubit.resetCourses();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.deepPurple,
                            ),
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
