/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Rendez-vous'),
      ),
      body:
       StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Une erreur s\'est produite : ${snapshot.error}');
          }

          List<DocumentSnapshot> appointments = snapshot.data!.docs;
          appointments.sort((a, b) => (a['date'] as Timestamp).compareTo(b['date'] as Timestamp));

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              Timestamp appointmentTimestamp = appointments[index]['date'];
              DateTime appointmentDate = appointmentTimestamp.toDate();

              return ListTile(
                title: Text(appointmentDate.toString()),
              );
            },
          );
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notebook/Cahier.dart';
class Historiquerendezvous extends StatefulWidget {
  const Historiquerendezvous({super.key});

  @override
  State<Historiquerendezvous> createState() => _HistoriquerendezvousState();
}

class _HistoriquerendezvousState extends State<Historiquerendezvous> {
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
            .orderBy('selectedDate', descending: true) // Tri par date (ordre décroissant)
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
              final mensuration = mensurations[index].data() as Map<String, dynamic>;
              final nomPrenom = mensuration['nomPrenom'];
              final selectedDate = mensuration['selectedDate'];

              return ListTile(
                title: Text(nomPrenom),
                subtitle: Text(selectedDate), // Afficher la date
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsPage(
                        mensurationDocument: mensuration,
                      ),
                    ),
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

/*class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> mensurationDocument;

  UserDetailsPage({required this.mensurationDocument});

  @override
  Widget build(BuildContext context) {
    final nomPrenom = mensurationDocument['nomPrenom'];
    final numero = mensurationDocument['numero'];
    // ... autres champs de mensuration ...
    final selectedDate = mensurationDocument['selectedDate'];

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
            // ... autres champs ...
            Text('-Date: $selectedDate'), // Afficher la date
          ],
        ),
      ),
    );
  }
}

*/