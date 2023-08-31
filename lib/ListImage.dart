import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images depuis Firebase')),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('images').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          
          var imageDocs = snapshot.data?.docs;

          return ListView.builder(
            itemCount: imageDocs?.length,
            itemBuilder: (context, index) {
              var imageURL = imageDocs?[index].data()['imageURL'];
              return Image.network(imageURL);
            },
          );
        },
      ),
    );
  }
}