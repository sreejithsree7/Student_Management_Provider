import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../model/student/student_model.dart';
import '../add_student/screen_add_student.dart';

class ScreenViewStudent extends StatelessWidget {
  const ScreenViewStudent({super.key, required this.student});
  final Student student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                isEdit = true;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScreenAddStudent(student: student)));
              },
              icon: const Icon(
                CupertinoIcons.pen,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .5),
          ),
          child: Column(
            children: [
              kHight50,
              kHight50,
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(student.image)),
              ),
              kHight20,
              Text(
                student.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              kHight10,
              Text(
                student.place,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              kHight10,
              Text(
                student.age,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              kHight10,
              Text(
                'Mobile: ${student.mobile}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
