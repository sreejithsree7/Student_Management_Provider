import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'from_camera.dart';
import 'from_gallery.dart';

Future<XFile> showBottomSheetWidget(BuildContext context) async {
  final completer = Completer<XFile>();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: .4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Select the image source:',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      XFile imagePath = await fromCamera();
                      completer.complete(imagePath);

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Camera',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      XFile imagePath = await fromGallery();
                      completer.complete(imagePath);

                     Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Gallery',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
  return completer.future;
}
