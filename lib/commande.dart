//code qui donne ne change pas
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'mensuration.dart';
import 'mensurationFemme.dart';

class NouvelleCommandeScreen extends StatefulWidget {
  @override
  _NouvelleCommandeScreenState createState() => _NouvelleCommandeScreenState();
}

class _NouvelleCommandeScreenState extends State<NouvelleCommandeScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _prixTotalController = TextEditingController();
  final TextEditingController _avanceController = TextEditingController();
  final TextEditingController _prixRestantController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  String _selectedGenre = '';
  
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nouvelle Commande'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID de la commande'),
                ),
                TextField(
                  controller: _prixTotalController,
                  decoration: InputDecoration(labelText: 'Prix total'),
                ),
                TextField(
                  controller: _avanceController,
                  decoration: InputDecoration(labelText: 'Avance'),
                ),
                TextField(
                  controller: _prixRestantController,
                  decoration: InputDecoration(labelText: 'Prix restant'),
                ),
                TextField(
                  controller: _modelController,
                  decoration: InputDecoration(labelText: 'Date du rendez-vous'),
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Sélectionner une photo du tissu'),
                ),
                if (_selectedImage != null) Image.file(_selectedImage!),
                Text(
                  'Choisissez le genre:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.man),
                      color:
                          _selectedGenre == 'homme' ? Colors.blue : Colors.grey,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Mensuration()));
                      },
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.girl),
                      color:
                          _selectedGenre == 'femme' ? Colors.pink : Colors.grey,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MensurationFemmeScreen()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                

                ElevatedButton(
                  onPressed: () {
                    // Appeler la méthode pour enregistrer la commande
                    _enregistrerCommande();
                  },
                  child: Text('Enregistrer la commande'),
                ),
              ],
            ),
          ),
        ));
  }

  void _enregistrerCommande() async {
    CommandeService commandeService = CommandeService();

    String idCommande = _idController.text;
    int prixTotal = int.parse(_prixTotalController.text);
    int avance = int.parse(_avanceController.text);
    int prixRestant = int.parse(_prixRestantController.text);
    String model = _modelController.text;
    DateTime dateDuJour = DateTime.now();
    DateTime dateDeRendezVous = DateTime.now().add(Duration(days: 7));

    // Appeler la méthode pour enregistrer la commande avec les détails saisis
    await commandeService.enregistrerNouvelleCommande(
      idCommande,
      prixTotal,
      avance,
      prixRestant,
      dateDuJour,
      dateDeRendezVous,
      model,
      _selectedImage!,
    );

    // Réinitialiser les champs après l'enregistrement
    _idController.clear();
    _prixTotalController.clear();
    _avanceController.clear();
    _prixRestantController.clear();
    _modelController.clear();
    setState(() {
      _selectedImage = null;
    });

    // Afficher un message ou une notification pour indiquer que la commande a été enregistrée
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('La commande a été enregistrée avec succès.')),
    );
  }
}

class Commande {
  String idCommande;
  int prixTotal;
  int avance;
  int prixRestant;
  DateTime dateDuJour;
  DateTime dateDeRendezVous;
  String model;

  Commande({
    required this.idCommande,
    required this.prixTotal,
    required this.avance,
    required this.prixRestant,
    required this.dateDuJour,
    required this.dateDeRendezVous,
    required this.model,
  });

  factory Commande.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Commande(
      idCommande: data['IdCommande'],
      prixTotal: data['Prix_total'],
      avance: data['Avance'],
      prixRestant: data['Prix_restant'],
      dateDuJour: data['Datedujour'].toDate(),
      dateDeRendezVous: data['Datederendez_vous'].toDate(),
      model: data['Model'],
    );
  }
}

class CommandeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> enregistrerNouvelleCommande(
    String idCommande,
    int prixTotal,
    int avance,
    int prixRestant,
    DateTime dateDuJour,
    DateTime dateDeRendezVous,
    String model,
    File photoFile,
  ) async {
    String photoUrl = await _uploadPhoto(idCommande, photoFile);

    await _firestore.collection('commandes').doc(idCommande).set({
      'IdCommande': idCommande,
      'Prix_total': prixTotal,
      'Avance': avance,
      'Prix_restant': prixRestant,
      'Datedujour': dateDuJour,
      'Datederendez_vous': dateDeRendezVous,
      'Model': model,
      'PhotoUrl': photoUrl,
    });
  }

  Future<String> _uploadPhoto(String idCommande, File photoFile) async {
    Reference storageReference = _storage.ref().child('photos/$idCommande.jpg');
    UploadTask uploadTask = storageReference.putFile(photoFile);
    TaskSnapshot storageTaskSnapshot = await uploadTask;

    String photoUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return photoUrl;
  }

}
