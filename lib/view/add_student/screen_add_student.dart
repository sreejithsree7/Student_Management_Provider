import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../condroller/provider/constants.dart';
import '../../core/constants.dart';
import '../../model/student/student_model.dart';
import 'functions/bottom_sheet.dart';
import 'widgets/save_button.dart';
import 'widgets/text_field.dart';

bool isEdit = false;

enum StudentOperation { edit, add }

class ScreenAddStudent extends StatefulWidget {
  ScreenAddStudent({super.key, this.student});
  final Student? student;

  @override
  State<ScreenAddStudent> createState() => _ScreenAddStudentState();
}

class _ScreenAddStudentState extends State<ScreenAddStudent> {
  final nameController = TextEditingController();

  final placeController = TextEditingController();

  final ageController = TextEditingController();

  final mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? imagePath;

  initTextControllers() {
    if (widget.student != null) {
      nameController.text = widget.student!.name;
      placeController.text = widget.student!.place;
      ageController.text = widget.student!.age;
      mobileController.text = widget.student!.mobile;
    }
  }

  @override
  void initState() {
    initTextControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('edit');
    final studentController =
        Provider.of<StudentProvider>(context, listen: false);
    if (isEdit) {
      studentController.imagePath = widget.student!.image;
    }
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        studentController.imagePath = '';
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(!isEdit ? 'Add Student' : 'Edit Student',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        imagePath = await showBottomSheetWidget(context);
                        if (imagePath != null) {
                          studentController.setImage(imagePath!.path);
                        }
                      },
                      child: Consumer<StudentProvider>(
                        builder: (context, value, _) {
                          return CircleAvatar(
                            radius: 70,
                            child: Container(
                              // height: height * .15,
                              // width: width * .35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  //border: Border.all(width: .01),
                                  image: value.imagePath.isNotEmpty
                                      ? DecorationImage(
                                          image:
                                              FileImage(File(value.imagePath)),
                                          fit: BoxFit.cover)
                                      : null),
                              child: value.imagePath.isEmpty
                                  ? const Center(
                                      child: Icon(
                                          CupertinoIcons.photo_on_rectangle),
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    kHight20,
                    TextFieldWidget(
                      nameController: nameController,
                      text: 'Name',
                      type: TextInputType.name,
                    ),
                    kHight20,
                    TextFieldWidget(
                      nameController: placeController,
                      text: 'Place',
                      type: TextInputType.name,
                    ),
                    kHight20,
                    TextFieldWidget(
                      nameController: ageController,
                      text: 'Age',
                      type: TextInputType.number,
                    ),
                    kHight20,
                    TextFieldWidget(
                      nameController: mobileController,
                      text: 'Mobile No',
                      type: TextInputType.phone,
                    ),
                    kHight20,
                    SaveButton(
                      width: width,
                      formKey: _formKey,
                      nameController: nameController,
                      placeController: placeController,
                      ageController: ageController,
                      mobileController: mobileController,
                      student: widget.student,
                      studentController: studentController,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
