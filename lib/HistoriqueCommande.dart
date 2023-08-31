/*import 'package:flutter/material.dart';

import 'ListImage.dart';
import 'choixmensuration.dart';
import 'commande.dart';

class HistoriqueCommande extends StatefulWidget {
  const HistoriqueCommande({super.key});

  @override
  State<HistoriqueCommande> createState() => _HistoriqueCommandeState();
}

class _HistoriqueCommandeState extends State<HistoriqueCommande> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Nombre d'onglets dans le menu
      child: Scaffold(
        appBar: AppBar(
          title: Text('Historique des commandes'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'En cours'),
              Tab(text: 'Livré'),
              Tab(text: 'Pret a etre livrer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CommandesScreen(),
            GenderSelectionPage(),
            ImageListPage()
          ],
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final TextEditingController _nameController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  File? _imageFile;
  String? _videoUrl;

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    Reference storageReference = _storage.ref().child('images/${DateTime.now()}.jpg');
    UploadTask uploadTask = storageReference.putFile(_imageFile!);
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

    String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

    setState(() {
      _imageFile = null;
      _videoUrl = imageUrl; // Store the image URL for display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Réservation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Sélectionner une image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Téléverser l\'image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mettre ici la logique pour insérer les données dans Firebase
                if (_videoUrl != null) {
                  _firestore.collection('reservations').add({
                    'name': _nameController.text,
                    'image_url': _videoUrl,
                  });
                }
              },
              child: Text('Réserver'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ReservationCardList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReservationCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reservations').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var reservationDocs = snapshot.data?.docs;

        return ListView.builder(
          itemCount: reservationDocs?.length,
          itemBuilder: (context, index) {
            var name = reservationDocs?[index].data()['name'];
            var imageUrl = reservationDocs?[index].data()['image_url'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReservationCard(name: name, imageUrl: imageUrl),
            );
          },
        );
      },
    );
  }
}

class ReservationCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  ReservationCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.network(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nom: $name'),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ReservationPage()));


 */
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Commande {
  final String idCommande;
  final int prixTotal;
  final int avance;
  final int prixRestant;
  final DateTime dateDuJour;
  final DateTime dateDeRendezVous;
  final String model;

  Commande({
    required this.idCommande,
    required this.prixTotal,
    required this.avance,
    required this.prixRestant,
    required this.dateDuJour,
    required this.dateDeRendezVous,
    required this.model,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commande App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListeCommandesScreen(),
    );
  }
}

class ListeCommandesScreen extends StatefulWidget {
  @override
  _ListeCommandesScreenState createState() => _ListeCommandesScreenState();
}

class _ListeCommandesScreenState extends State<ListeCommandesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Commandes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('commandes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Commande> commandes = [];
          for (var doc in snapshot.data!.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            Commande commande = Commande(
              idCommande: data['idCommande'],
              prixTotal: data['prixTotal'],
              avance: data['avance'],
              prixRestant: data['prixRestant'],
              dateDuJour: data['dateDuJour'].toDate(),
              dateDeRendezVous: data['dateDeRendezVous'].toDate(),
              model: data['model'],
            );
            commandes.add(commande);
          }

          return ListView.builder(
            itemCount: commandes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Commande ID: ${commandes[index].idCommande}'),
                subtitle: Text('Date de Rendez-vous: ${commandes[index].dateDeRendezVous.toString()}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailCommandeScreen(commande: commandes[index])),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DetailCommandeScreen extends StatelessWidget {
  final Commande commande;

  DetailCommandeScreen({required this.commande});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Commande'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('ID de la commande: ${commande.idCommande}'),
            Text('Prix Total: ${commande.prixTotal}'),
            Text('Avance: ${commande.avance}'),
            Text('Prix Restant: ${commande.prixRestant}'),
            Text('Date de Rendez-vous: ${commande.dateDeRendezVous.toString()}'),
            Text('Modèle: ${commande.model}'),
          ],
        ),
      ),
    );
  }
}
