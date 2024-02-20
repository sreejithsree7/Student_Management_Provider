import 'package:flutter/material.dart';

import '../../../condroller/provider/constants.dart';
import '../../../model/student/student_model.dart';
import '../../home/screen_home.dart';
import '../screen_add_student.dart';

class SaveButton extends StatelessWidget {

  
  const SaveButton({
    super.key,
    required this.width,
    required this.formKey,
    required this.nameController,
    required this.placeController,
    required this.ageController,
    required this.mobileController,
    required this.student,
    required this.studentController,
  });

  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController placeController;
  final TextEditingController ageController;
  final TextEditingController mobileController;
  final Student? student;
  final StudentProvider studentController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width - 100,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            final name = nameController.text;
            final place = placeController.text;
            final age = ageController.text;
            final mobile = mobileController.text;

            final student = Student(
              id: isEdit ? this.student!.id : 0,
              name:name,
              place: place,
              age: age,
              mobile: mobile,
              image: studentController.imagePath,
            );
            isEdit
                ? studentController.updateStudent(student)
                : studentController.insertStudent(student);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => const ScreenHome()),
                (route) => false);
          }
        },
        child: isEdit
            ? const Text(
                'Update',
                style: TextStyle(color: Colors.black),
              )
            : const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
      ),
    );
  }
}
