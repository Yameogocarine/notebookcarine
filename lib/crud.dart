import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDPage extends StatefulWidget {
  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour ajouter un document dans Firebase Firestore
  Future<void> _addDocument() async {
    await _firestore.collection('items').add({
      'title': _titleController.text,
      'description': _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
  }

  // Méthode pour mettre à jour un document dans Firebase Firestore
  Future<void> _updateDocument(String documentId) async {
    await _firestore.collection('items').doc(documentId).update({
      'title': _titleController.text,
      'description': _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
  }

  // Méthode pour supprimer un document dans Firebase Firestore
  Future<void> _deleteDocument(String documentId) async {
    await _firestore.collection('items').doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Operations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addDocument,
                  child: Text('Ajouter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Mettez ici la logique pour afficher les données depuis Firebase
                  },
                  child: Text('Afficher'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mettez ici la logique pour mettre à jour les données dans Firebase
              },
              child: Text('Mettre à jour'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mettez ici la logique pour supprimer les données de Firebase
              },
              child: Text('Supprimer'),
            ),
          ],
        ),
      ),
    );
  }
}

