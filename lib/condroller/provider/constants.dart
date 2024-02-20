import 'package:flutter/material.dart';

import '../../model/student/student_model.dart';
import '../db_services/student_db_services.dart';

class StudentProvider extends ChangeNotifier {
  final StudentServices services = StudentServices();
  List<Student> students = [];

  String imagePath = '';

  void setImage(String image) {
    imagePath = image;
    notifyListeners();
  }

  getAllStudents() async {
    students = await services.getStudents();
    notifyListeners();
  }

  getFilteredStudents(String query) async {
    List<Student> studentsList = await services.getStudents();
    students = studentsList
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  insertStudent(Student student) async {
    await services.insert(student);
    notifyListeners();
    await services.getStudents();
  }

  updateStudent(Student student) async {
    await services.update(student).then((value) => getAllStudents());
  }

  deleteStudent(int id) async {
    await services.delete(id).then((value) => getAllStudents());
  }
}
