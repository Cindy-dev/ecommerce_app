import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedImage extends StatefulWidget {
  const PickedImage({Key? key}) : super(key: key);

  @override
  State<PickedImage> createState() => _PickedImageState();
}

class _PickedImageState extends State<PickedImage> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
