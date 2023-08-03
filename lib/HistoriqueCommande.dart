import 'package:flutter/material.dart';

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
            Center(child: Text('Contenu de l\'onglet 1')),
            Center(child: Text('Contenu de l\'onglet 2')),
            Center(child: Text('Contenu de l\'onglet 3')),
          ],
        ),
      ),
    );
  }
}

 