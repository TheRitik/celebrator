import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? _image;

Future<void> _pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
