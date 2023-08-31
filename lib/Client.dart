/*class Client {
  int _idClient;
  String _nomClient;
  String _numeroClient;
  String _sexe;

  // Constructeur
  Client({
    required int idClient,
    required String nomClient,
    required String numeroClient,
    required String sexe,
  })  : _idClient = idClient,
        _nomClient = nomClient,
        _numeroClient = numeroClient,
        _sexe = sexe;

  // Getters
  int get idClient => _idClient;
  String get nomClient => _nomClient;
  String get numeroClient => _numeroClient;
  String get sexe => _sexe;

  // Méthode pour afficher les détails du client
  void afficherDetails() {
    print('ID Client: $_idClient');
    print('Nom du Client: $_nomClient');
    print('Numéro du Client: $_numeroClient');
    print('Sexe: $_sexe');
  }
}
 */
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ClientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Clients'),
      ),
      body: ClientList(),
    );
  }
}

class ClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('clients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<DocumentSnapshot> clientDocs = snapshot.data!.docs;
        List<Client> clients = clientDocs.map((doc) => Client.fromFirestore(doc)).toList();

        return ListView.builder(
          itemCount: clients.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(clients[index].nomClient),
              subtitle: Text(clients[index].numeroClient),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientDetailScreen(client: clients[index]),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ClientDetailScreen extends StatelessWidget {
  final Client client;

  ClientDetailScreen({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(client.nomClient),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nom du Client: ${client.nomClient}'),
          Text('Numéro du Client: ${client.numeroClient}'),
          Text('Sexe: ${client.sexe}'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommandesScreen(client: client),
                ),
              );
            },
            child: Text('Voir les Commandes'),
          ),
        ],
      ),
    );
  }
}

class CommandesScreen extends StatelessWidget {
  final Client client;

  CommandesScreen({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commandes de ${client.nomClient}'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('commandes').where('idClient', isEqualTo: client.idClient).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<DocumentSnapshot> commandeDocs = snapshot.data!.docs;
          List<Commande> commandes = commandeDocs.map((doc) => Commande.fromFirestore(doc)).toList();

          return ListView.builder(
            itemCount: commandes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Commande #${commandes[index].idCommande}'),
                subtitle: Text('Prix total: ${commandes[index].prixTotal}'),
              );
            },
          );
        },
      ),
    );
  }
}

class Client {
  int idClient;
  String nomClient;
  String numeroClient;
  String sexe;

  Client({
    required this.idClient,
    required this.nomClient,
    required this.numeroClient,
    required this.sexe,
  });

  factory Client.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Client(
      idClient: data['idClient'],
      nomClient: data['nomClient'],
      numeroClient: data['numeroClient'],
      sexe: data['sexe'],
    );
  }
}

class Commande {
  int idCommande;
  int prixTotal;

  Commande({
    required this.idCommande,
    required this.prixTotal,
  });

  factory Commande.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Commande(
      idCommande: data['idCommande'],
      prixTotal: data['prixTotal'],
    );
  }
}
