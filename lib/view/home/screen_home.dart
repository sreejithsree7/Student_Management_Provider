import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../condroller/provider/constants.dart';
import '../../core/constants.dart';
import '../add_student/screen_add_student.dart';
import '../view_student/screen_view_student.dart';
import 'widget/edit_delete_combo.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final studentController =
        Provider.of<StudentProvider>(context, listen: false);
    studentController.getAllStudents();
    print(studentController.students);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(8),
                backgroundColor: Colors.grey,
                prefixIcon:
                    const Icon(CupertinoIcons.search, color: Colors.white),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                    color: Colors.white),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  studentController.getFilteredStudents(value);
                },
              ),
              kHight20,
              Expanded(child: Consumer<StudentProvider>(
                builder: (context, value, _) {
                  // print(value.students[0].name);
                  return value.students.isEmpty
                      ? const Center(
                          child: Text(
                            'No data available',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (_, index) {
                            final student = value.students[index];
                            return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(student.image)),
                                ),
                                title: Text(student.name),
                                subtitle: Text(student.place),
                                trailing: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: EditDeleteCombo(student: student),
                                ),
                                onTap: () => {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenViewStudent(
                                            student: student,
                                          ),
                                        ),
                                      )
                                    });
                          },
                          separatorBuilder: (_, index) {
                            return const Divider(height: .5, thickness: 1);
                          },
                          itemCount: value.students.length,
                        );
                },
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            isEdit = false;
            Navigator.of(context)
                .pushNamed('/addStudent')
                .then((value) => studentController.getAllStudents());
          },
          child: const Icon(
            CupertinoIcons.add,
          )),
    );
  }
}
