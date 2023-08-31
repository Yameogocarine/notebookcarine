import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cahier extends StatefulWidget {
  const Cahier({super.key});

  @override
  State<Cahier> createState() => _CahierState();
}

class _CahierState extends State<Cahier> {
  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mon cahier de mesure '),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Color.fromARGB(255, 212, 153, 4),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('mensurations')
              .where('nomPrenom', isGreaterThanOrEqualTo: _searchQuery)
              .orderBy('nomPrenom')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Une erreur est survenue');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final mensurations = snapshot.data!.docs;
            return ListView.builder(
              itemCount: mensurations.length,
              itemBuilder: (context, index) {
                final mensuration =
                    mensurations[index].data() as Map<String, dynamic>;
                final nomPrenom = mensuration['nomPrenom'];

                return ListTile(
                  title: Text(nomPrenom), // Afficher le nom d'utilisateur
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserDetailsPage(mensurationDocument: mensuration),
                      ),
                    );
                  },
                );
              },
            );
          },
        ));
  }
}

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> mensurationDocument;

  UserDetailsPage({required this.mensurationDocument});

  @override
  Widget build(BuildContext context) {
    final nomPrenom = mensurationDocument['nomPrenom'];
    final numero = mensurationDocument['numero'];
    final dos = mensurationDocument['dos'];
    final epaule = mensurationDocument['epaule'];
    final poitrine = mensurationDocument['poitrine'];
    final longManche = mensurationDocument['longManche'];
    final tourManche = mensurationDocument['tourManche'];
    final longTaille = mensurationDocument['longTaille'];
    final longRobe = mensurationDocument['longRobe'];
    final longChemise = mensurationDocument['longChemise'];
    final ceinture = mensurationDocument['ceinture'];
    final basin = mensurationDocument['basin'];
    final cuisse = mensurationDocument['cuisse'];
    final longJupe = mensurationDocument['longJupe'];
    final longPantalon = mensurationDocument['longPantalon'];
    final String selectedDate = mensurationDocument['selectedDate'];
    final String currentDate= mensurationDocument['currentDate'];
    

    return Scaffold(
      appBar: AppBar(
        title: Text(nomPrenom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('-NomPrenom: $nomPrenom'),
            Text('-Numero: $numero '),
            Text('-Dos: $dos'),
            Text('-Epaule: $epaule '),
            Text('-Poitrine: $poitrine'),
            Text('-LongManche : $longManche '),
            Text('-TourManche: $tourManche '),
            Text('-LongTaille: $longTaille'),
            Text('-LongRobe: $longRobe '),
            Text('-longChemise: $longChemise'),
            Text('-Ceinture: $ceinture'),
            Text('-Basin: $basin '),
            Text('-Cuisse: $cuisse'),
            Text('-LongJupe: $longJupe '),
            Text('-longPantalon: $longPantalon'),
            Text('-Date: $selectedDate'),
            Text('-Date du jour: $currentDate'),

            // Personnalisez l'affichage en fonction de vos besoins

            // Ajoutez d'autres données ici en fonction de votre modèle
          ],
        ),
      ),
    );
  }
}

