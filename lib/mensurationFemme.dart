import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MensurationFemme {
  int dos;
  int epaule;
  int poitrine;
  int longManche;
  int tourManche;
  int longTaille;
  int tourTaille;
  int pince;
  int longRobe;
  int longHaute;
  int ceinture;
  int basin;
  int cuisse;
  int longJupe;
  int longPantalon;

  MensurationFemme({
    required this.dos,
    required this.epaule,
    required this.poitrine,
    required this.longManche,
    required this.tourManche,
    required this.longTaille,
    required this.tourTaille,
    required this.pince,
    required this.longRobe,
    required this.longHaute,
    required this.ceinture,
    required this.basin,
    required this.cuisse,
    required this.longJupe,
    required this.longPantalon,
  });

  // Ajoutez cette méthode
  factory MensurationFemme.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return MensurationFemme(
      dos: data['Dos'],
      epaule: data['Epaule'],
      poitrine: data['Poitrine'],
      longManche: data['Longmanche'],
      tourManche: data['Tourmanche'],
      longTaille: data['Longtaille'],
      tourTaille: data['Tourtaille'],
      pince: data['Pince'],
      longRobe: data['Longrobe'],
      longHaute: data['LongHaute'],
      ceinture: data['Ceinture'],
      basin: data['Basin'],
      cuisse: data['Cuisse'],
      longJupe: data['Longjupe'],
      longPantalon: data['Longpantalon'],
    );
  }
}
// ... constructeur et méthode fromFirestore restent les mêmes

class MensurationFemmeScreen extends StatefulWidget {
  @override
  _MensurationFemmeScreenState createState() => _MensurationFemmeScreenState();
}

class _MensurationFemmeScreenState extends State<MensurationFemmeScreen> {
  final TextEditingController _dosController = TextEditingController();
  final TextEditingController _epauleController = TextEditingController();
  final TextEditingController _poitrineController = TextEditingController();
  final TextEditingController _longMancheController = TextEditingController();
  final TextEditingController _tourMancheController = TextEditingController();
  final TextEditingController _longTailleController = TextEditingController();
  final TextEditingController _tourTailleController = TextEditingController();
  final TextEditingController _pinceController = TextEditingController();
  final TextEditingController _longRobeController = TextEditingController();
  final TextEditingController _longHauteController = TextEditingController();
  final TextEditingController _ceintureController = TextEditingController();
  final TextEditingController _basinController = TextEditingController();
  final TextEditingController _cuisseController = TextEditingController();
  final TextEditingController _longJupeController = TextEditingController();
  final TextEditingController _longPantalonController = TextEditingController();

  void _ajouterMensuration() async {
    MensurationFemme mensuration = MensurationFemme(
      dos: int.parse(_dosController.text),
      epaule: int.parse(_epauleController.text),
      poitrine: int.parse(_poitrineController.text),
      longManche: int.parse(_longMancheController.text),
      tourManche: int.parse(_tourMancheController.text),
      longTaille: int.parse(_longTailleController.text),
      tourTaille: int.parse(_tourTailleController.text),
      pince: int.parse(_pinceController.text),
      longRobe: int.parse(_longRobeController.text),
      longHaute: int.parse(_longHauteController.text),
      ceinture: int.parse(_ceintureController.text),
      basin: int.parse(_basinController.text),
      cuisse: int.parse(_cuisseController.text),
      longJupe: int.parse(_longJupeController.text),
      longPantalon: int.parse(_longPantalonController.text),
    );

    await FirebaseFirestore.instance.collection('mensurationsFemme').add({
      'Dos': mensuration.dos,
      'Epaule': mensuration.epaule,
      'Poitrine': mensuration.poitrine,
      'Longmanche': mensuration.longManche,
      'Tourmanche': mensuration.tourManche,
      'Longtaille': mensuration.longTaille,
      'Tourtaille': mensuration.tourTaille,
      'Pince': mensuration.pince,
      'Longrobe': mensuration.longRobe,
      'LongHaute': mensuration.longHaute,
      'Ceinture': mensuration.ceinture,
      'Basin': mensuration.basin,
      'Cuisse': mensuration.cuisse,
      'Longjupe': mensuration.longJupe,
      'Longpantalon': mensuration.longPantalon,
    });

    _viderChamps();
  }

  void _viderChamps() {
    _dosController.clear();
    _epauleController.clear();
    _poitrineController.clear();
    _longMancheController.clear();
    _tourMancheController.clear();
    _longTailleController.clear();
    _tourTailleController.clear();
    _pinceController.clear();
    _longRobeController.clear();
    _longHauteController.clear();
    _ceintureController.clear();
    _basinController.clear();
    _cuisseController.clear();
    _longJupeController.clear();
    _longPantalonController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensurations Femme'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _dosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dos',
                prefixIcon: Image.asset(
                  'asset/Tourtailler.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _epauleController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Epaule',
                prefixIcon: Image.asset(
                  'asset/Epauler.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _poitrineController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Poitrine',
                prefixIcon: Image.asset(
                  'asset/Poitriner.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _longMancheController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Longueur Manche',
                prefixIcon: Image.asset(
                  'asset/longmanche.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _tourMancheController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tour Manche',
                prefixIcon: Image.asset(
                  'asset/longmanche.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _longTailleController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Longueur  Manche',
                prefixIcon: Image.asset(
                  'asset/longmancher.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _tourTailleController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tour Manche',
                prefixIcon: Image.asset(
                  'asset/Tourtailler.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _pinceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pince',
                prefixIcon: Image.asset(
                  'asset/longmancher.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _longRobeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Long robe',
                prefixIcon: Image.asset(
                  'asset/longrober.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _longHauteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Longueur Haute',
                prefixIcon: Image.asset(
                  'asset/longchemiser.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _ceintureController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ceinture',
                prefixIcon: Image.asset(
                  'asset/longmancher.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _basinController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Basin',
                prefixIcon: Image.asset(
                  'asset/Basin.jpg', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
              controller: _cuisseController,
              decoration: InputDecoration(labelText: 'Cuisse'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _longJupeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Long Jupe',
                prefixIcon: Image.asset(
                  'asset/longpantlonr.png', // Chemin vers l'image dans les assets
                  width: 24, // Largeur de l'icône
                  height: 24, // Hauteur de l'icône
                ),
              ),
            ),
            TextField(
                controller: _longPantalonController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Long Pantalon',
                  prefixIcon: Image.asset(
                    'asset/longpantalonr.png', // Chemin vers l'image dans les assets
                    width: 24, // Largeur de l'icône
                    height: 24, // Hauteur de l'icône
                  ),
                )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _ajouterMensuration,
              child: Text('Ajouter Mensuration'),
            ),
            SizedBox(height: 32),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('mensurationsFemme')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                List<MensurationFemme> mensurations = [];
                snapshot.data!.docs.forEach((doc) {
                  mensurations.add(MensurationFemme.fromFirestore(doc));
                });

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: mensurations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Poitrine: ${mensurations[index].poitrine}'),
                      subtitle: Text(
                          'Tour de Taille: ${mensurations[index].tourTaille}'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
