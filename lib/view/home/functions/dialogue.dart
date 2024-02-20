import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../condroller/provider/constants.dart';

deleteStudent(BuildContext context, int id) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Delete Student'),
            content: const Text(
              'Are you sure to delete the student?',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    context.read<StudentProvider>().deleteStudent(id);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'))
            ],
          ));
}
