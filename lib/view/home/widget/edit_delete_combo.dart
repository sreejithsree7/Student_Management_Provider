import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/student/student_model.dart';
import '../../add_student/screen_add_student.dart';
import '../functions/dialogue.dart';

class EditDeleteCombo extends StatelessWidget {
  const EditDeleteCombo({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              isEdit = true;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ScreenAddStudent(
                            student: student,
                          )));
            },
            icon: const Icon(
              CupertinoIcons.pencil,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              deleteStudent(context, student.id);
            },
            icon: const Icon(
              CupertinoIcons.delete_solid,
              color: Colors.black,
            ))
      ],
    );
  }
}
