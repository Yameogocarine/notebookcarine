import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notebook/function.dart';
import 'dart:io';
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
        // Upload image to Firebase Storage
        Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
        UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
        TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

        // Get image URL
        String imageURL = await storageTaskSnapshot.ref.getDownloadURL();

        // Save image URL to Firestore
        await FirebaseFirestore.instance.collection('images').add({'imageURL': imageURL});
        
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
