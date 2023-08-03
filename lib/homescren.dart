//import 'package:book/Camera.dart';
//code bon non touche
/*
import 'package:notebook/function.dart';
import 'package:flutter/material.dart';

import 'Model.dart';



//import 'Camera.dart';

class Mensuration extends StatefulWidget {
  const Mensuration({super.key});

  @override
  State<Mensuration> createState() => _MensurationState();
}

class _MensurationState extends State<Mensuration> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    appBar : AppBar(
        title: const Text("Home "),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed:()async{ 
              await disconnect();
          }, icon:
          const Icon(Icons.save))
        ], 
      ),
      
    
    body:SingleChildScrollView(
      
      child:Container(
         color: Color(0xFFF7990D),
       
        margin: const EdgeInsets.all(9),
        child: Column(children: [
          
           
           //espace pour le client
           
           // Épaisseur de la bordure
              
             //Information du client
             // 
           Center(
          child: Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Column(
              children: [ 
          
          TextField(
            style: TextStyle(fontSize: 21),
            decoration: InputDecoration(
              labelText: 'Nom & Prenom'
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 21),
            
            decoration: InputDecoration(
              icon: Icon(Icons.call),
              labelText: 'Numero'
            ),
          ),
          ] 
           )
           ),
           ),
  SizedBox(height: 20),
           //tissu et le model
           Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child:Center(
          child: IconButton(
            icon: Icon(Icons.camera_alt), // Icône de caméra
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImagePickerButton ()));
              print('Inserer le model et ou la photo du tisu !');
            },
          ),
        ),
         ),
        
      
          //Mensuration du client
          TextField(
            style: TextStyle(fontSize: 21,),
            
            decoration: InputDecoration(
              labelText: 'Note'
            ),
            ),
            
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                  
                decoration: const InputDecoration(
                 labelText: 'Epaule',
                  border: OutlineInputBorder(),
                  
                 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Poitrine',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                  labelText: 'Long manche',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tour de manche',
                  
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              style: TextStyle(color: Colors.white), // Couleur du texte en blanc
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tour de manche',
              ),
            ),
          ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Long taille',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tour de taille',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pince',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Long camisole',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Longueur robe',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                  labelText: 'Longueur chemise',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                  labelText: 'Ceinture',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                  labelText: 'Bassin',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cuisse',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                  labelText: 'Genoux',
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Longueur Jupe',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Longueur Patalon',
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Prix Total',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Avance',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Prix Restant',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
             
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                  labelText: ' Rendez_vous',
                ),
              ),
            ),
            
           ]  , 
            
          
         ),
           )
          )
            );
                 } 
                   }*/
                   //fin du bon code a ne pas toucher