import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notebook/Cahier.dart';
import 'package:notebook/Client.dart';
import 'package:notebook/MesurationHomme.dart';
import 'package:notebook/commande.dart';
import 'package:notebook/function.dart';
import 'package:notebook/mensuration.dart';
import 'package:notebook/mensurationFemme.dart';
import 'HistoriqueCommande.dart';
import 'HistoriqueRendez.dart';
import 'Model.dart';
import 'choixmensuration.dart';

class Home extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil "),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () async {
                await disconnect();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      backgroundColor: Color(0xFFF1890B),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            margin: const EdgeInsets.all(9),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImagePickerButton()));
                      },
                      //loading ?null :sendOtpCode,
                      child: const Text(
                        "Nouvelle commande",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NouvelleCommandeScreen()));
                      },
                      //loading ?null :sendOtpCode,
                      child: const Text(
                        "Commandes",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                        elevation: 5.0,
                      ), // Elevation (shadow)

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Historiquerendezvous()));
                      },

                      //loading ?null :sendOtpCode,
                      child: const Text(
                        "Rendez_vous",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Cahier()));
                      },
                      //loading ?null :sendOtpCode,
                      child: const Text(
                        "Cahier de mesure",
                        style: TextStyle(fontSize: 20),
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
