import 'package:flutter/material.dart';

class Rendez_vous extends StatefulWidget {
  const Rendez_vous({super.key});

  @override
  State<Rendez_vous> createState() => _Rendez_vousState();
}

class _Rendez_vousState extends State<Rendez_vous> {
  

  @override
  Widget build(BuildContext context) {
    return 
   DefaultTabController(
      length: 3, // Nombre d'onglets dans le menu
      child: Scaffold(
        appBar: AppBar(
          title: Text('Historiques de rendez_vous'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Rendez_vous',),
              Tab(text: 'Livré'),
              Tab(text: 'Pret a etre livrer'),
            ],
            labelColor: Colors.blue, // Couleur de l'onglet actif
              unselectedLabelColor: Colors.black, // Couleur des onglets inactifs
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
