import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    super.key,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }

  void selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }

  void uploadImage() async {
    // Example usage of the uploadImageToStorage method
    if (_image != null) {
      // Handle the download URL as needed (e.g., save it to user profile)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_image != null)
            Image.memory(
              _image!,
              height: 100,
              width: 100,
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: selectImageFromGallery,
            child: const Text('Select from Gallery'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: selectImageFromCamera,
            child: const Text('Take a Photo'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: uploadImage,
            child: const Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
