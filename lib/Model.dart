import 'package:flutter/material.dart';
import 'package:notebook/function.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImagePickerButton extends StatefulWidget {
  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Erreur lors de la sélection de l'image/vidéo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     body: 
       Column(
      children: [
        _imageFile != null
            ? Image.file(
                _imageFile!,
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              )
           /* : Container(
                width: 150,
                height: 150,
                color: Colors.grey,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 50,
                ),
              ),
        SizedBox(height: 16),*/
       : Row(
        
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           ElevatedButton(
  onPressed: () => _pickImage(ImageSource.camera),
  child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.camera), // Insert the desired icon here
      SizedBox(width: 8), // Optional space between the icon and the text
      Text('Prendre une photo'),
    ],
  ),
),



 ElevatedButton(
  onPressed: () => _pickImage(ImageSource.gallery),
  child: Column(  
    
    children: [
      Icon(Icons.browse_gallery), // Insert the desired icon here
      SizedBox(width: 8), // Optional space between the icon and the text
     Text('Importer depuis la galerie'),

    ],
  ),
   )



           
          ],
        ),
      ],
    )
     );
  }
}