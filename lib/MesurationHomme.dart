import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MensurationHomme {
  int poignet;
  int epaule;
  int dos;
  int longManche;
  int tourManche;
  int longTaille;
  int tourTaille;
  int longChemise;
  int ceinture;
  int basin;
  int cuisse;
  int longPantalon;

  MensurationHomme({
    required this.poignet,
    required this.epaule,
    required this.dos,
    required this.longManche,
    required this.tourManche,
    required this.longTaille,
    required this.tourTaille,
    required this.longChemise,
    required this.ceinture,
    required this.basin,
    required this.cuisse,
    required this.longPantalon,
  });

  // Méthode pour créer un objet MensurationHomme à partir d'un document Firestore
  factory MensurationHomme.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return MensurationHomme(
      poignet: data['Poignet'],
      epaule: data['Epaule'],
      dos: data['Dos'],
      longManche: data['Longmanche'],
      tourManche: data['Tourmanche'],
      longTaille: data['Longtaille'],
      tourTaille: data['Tourtaille'],
      longChemise: data['Longchemise'],
      ceinture: data['Ceinture'],
      basin: data['Basin'],
      cuisse: data['Cuisse'],
      longPantalon: data['Longpantalon'],
    );
  }
}


class MensurationHommeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensurations Homme'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('mensurationsHomme').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<MensurationHomme> mensurations = [];
          snapshot.data?.docs.forEach((doc) {
            mensurations.add(MensurationHomme.fromFirestore(doc));
          });

          return ListView.builder(
            itemCount: mensurations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Longueur du bras: ${mensurations[index].longManche}'),
                subtitle: Text('Tour de taille: ${mensurations[index].tourTaille}'),
                leading: Image.asset('assets/Tourtaille.jpg'), // Ajoutez l'image ici
              );
            },
          );
        },
      ),
    );
  }
}

