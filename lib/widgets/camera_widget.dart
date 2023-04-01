import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class MyCameraWidget extends StatefulWidget {
  const MyCameraWidget({Key? key}) : super(key: key);

  @override
  _MyCameraWidgetState createState() => _MyCameraWidgetState();
}

class _MyCameraWidgetState extends State<MyCameraWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveImage() async {
    if (_image == null) {
      return;
    }
    final result = await GallerySaver.saveImage(_image!.path);
    print(result);
  }

  Widget _buildBody() {
    if (_image == null) {
      return Center(child: Text('No image selected.'));
    } else {
      return Center(child: Image.file(_image!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.camera),
            tooltip: 'Take a photo',
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _saveImage,
            tooltip: 'Save photo',
            child: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
