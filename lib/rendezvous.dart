/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'rendez-vous.dart';
import 'rendezvous_provider.dart';

class RendezVousPage extends StatelessWidget {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final rendezVousProvider = Provider.of<RendezVousProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Gestion des Rendez-vous')),
      body: Column(
        children: [
          TextField(controller: _titreController, decoration: InputDecoration(labelText: 'Titre')),
          TextField(controller: _dateController, decoration: InputDecoration(labelText: 'Date')),
          ElevatedButton(
            onPressed: () {
              final rendezVous = RendezVous(
                id: DateTime.now().toString(),
                titre: _titreController.text,
                date: DateTime.parse(_dateController.text),
                estCritique: false,
              );
              rendezVousProvider.ajouterRendezVous(rendezVous);
              _titreController.clear();
              _dateController.clear();
               } ),
                 ]  
                   )
                   );
                     }
                       }*/
