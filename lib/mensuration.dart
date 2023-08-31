//code pour essaie
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'function.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Mensuration extends StatefulWidget {
  @override
  _MensurationState createState() => _MensurationState();
}

class _MensurationState extends State<Mensuration> {
  final TextEditingController nomPrenomController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController dosController = TextEditingController();
  final TextEditingController epauleController = TextEditingController();
  final TextEditingController poitrineController = TextEditingController();
  final TextEditingController longMancheController = TextEditingController();
  final TextEditingController tourMancheController = TextEditingController();
  final TextEditingController longTailleController = TextEditingController();
  final TextEditingController tourTailleController = TextEditingController();
  final TextEditingController longRobeController = TextEditingController();
  final TextEditingController longChemiseController = TextEditingController();
  final TextEditingController ceintureController = TextEditingController();
  final TextEditingController basinController = TextEditingController();
  final TextEditingController cuisseController = TextEditingController();
  final TextEditingController longJupeController = TextEditingController();
  final TextEditingController longPantalonController = TextEditingController();
  final TextEditingController selectedDateController = TextEditingController();
  final TextEditingController currentDateController = TextEditingController();

  void _addMensuration() {
    String nomPrenom = nomPrenomController.text;
    String numero = numeroController.text;
    String dos = dosController.text;
    String epaule = epauleController.text;
    String poitrine = poitrineController.text;
    String longManche = longMancheController.text;
    String tourManche = tourMancheController.text;
    String longTaille = longTailleController.text;
    String tourTaille = tourTailleController.text;
    String longRobe = longRobeController.text;
    String longChemise = longChemiseController.text;
    String ceinture = ceintureController.text;
    String basin = basinController.text;
    String cuisse = cuisseController.text;
    String longJupe = longJupeController.text;
    String longPantalon = longPantalonController.text;
    String selectedDate = selectedDateController.text;
    String currentDate = currentDateController.text;

    if (nomPrenom.isNotEmpty && numero.isNotEmpty && dos.isNotEmpty ||
        epaule.isNotEmpty ||
        poitrine.isNotEmpty ||
        longManche.isNotEmpty ||
        tourManche.isNotEmpty ||
        longTaille.isNotEmpty ||
        tourTaille.isNotEmpty ||
        longRobe.isNotEmpty ||
        longChemise.isNotEmpty ||
        ceinture.isNotEmpty ||
        basin.isNotEmpty ||
        cuisse.isNotEmpty ||
        longJupe.isNotEmpty ||
        longPantalon.isNotEmpty ||
        currentDate.isNotEmpty && selectedDate.isNotEmpty) {
      FirebaseFirestore.instance.collection('mensurations').add({
        'nomPrenom': nomPrenom,
        'numero': numero,
        'dos': dos,
        'epaule': epaule,
        'poitrine': poitrine,
        'longManche': longManche,
        'tourManche': tourManche,
        'longTaille': longTaille,
        'tourTaille': tourTaille,
        'longRobe': longRobe,
        'longChemise': longChemise,
        'ceinture': ceinture,
        'basin': basin,
        'cuisse': cuisse,
        'longJupe': longJupe,
        'longPantalon': longPantalon,
        'selectedDate': selectedDate,
        'currentDate': currentDate,
      });

      nomPrenomController.clear();
      numeroController.clear();
      dosController.clear();
      epauleController.clear();
      poitrineController.clear();
      tourMancheController.clear();
      longTailleController.clear();
      tourTailleController.clear();
      longRobeController.clear();
      longChemiseController.clear();
      ceintureController.clear();
      basinController.clear();
      cuisseController.clear();
      longJupeController.clear();
      longPantalonController.clear();
      selectedDateController.clear();
      currentDateController.clear();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajouter une nouvelle commande "),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () async {
                  await disconnect();
                },
                icon: const Icon(Icons.save))
          ],
        ),
        backgroundColor: Color.fromARGB(255, 212, 153, 4),
        body: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      TextField(
                        controller: nomPrenomController,
                        style: TextStyle(fontSize: 21),
                        decoration: InputDecoration(labelText: 'Nom & Prenom'),
                      ),
                      TextField(
                        controller: numeroController,
                        style: TextStyle(fontSize: 21),
                        decoration: InputDecoration(
                            icon: Icon(Icons.call), labelText: 'Numero'),
                      ),
                      //Mensuration du client

                      Text('Inseré le model ou la photo du tissu du client'),

                      TextFormField(
                        controller: dosController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Dos',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: epauleController,
                        decoration: const InputDecoration(
                          labelText: 'Epaule',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: poitrineController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Poitrine',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longMancheController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Long manche',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),

                      //reduire le code pour essaier

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: tourMancheController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tour de manche',
                        ),
                      ),

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longTailleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Long taille',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: tourTailleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tour de taille',
                          prefixIcon: Image.asset(
                            'asset/Tourtailler.png', // Chemin vers l'image dans les assets
                            width: 24, // Largeur de l'icône
                            height: 24, // Hauteur de l'icône
                          ),
                        ),
                      ),

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pince',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Long camisole',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longRobeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Longueur robe',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longChemiseController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Longueur chemise',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: ceintureController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ceinture',
                        ),
                      ),

                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: basinController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bassin',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: cuisseController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cuisse',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Genoux',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longJupeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Longueur Jupe',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Utilisez FilteringTextInputFormatter.digitsOnly
                        keyboardType: TextInputType.number,
                        controller: longPantalonController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Longueur Patalon',
                        ),
                      ),

                      TextFormField(
                        controller: currentDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Date du jour',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                          DateTime now = DateTime.now();
                          currentDateController.text =
                              DateFormat('yyyy-MM-dd').format(now);
                        },
                      ),

                      TextFormField(
                        controller: selectedDateController,
                        readOnly: true, // Désactiver l'édition
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            selectedDateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          }
                        },
                      ),

                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _addMensuration,
                        child: Text('Ajouter'),
                      ),
                    ])))));
  }
}
