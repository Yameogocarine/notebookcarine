import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notebook/Cahier.dart';
import 'package:notebook/HistoriqueCommande.dart';
import 'package:notebook/HistoriqueRendez.dart';
import 'package:notebook/Model.dart';
import 'package:notebook/function.dart';
import 'package:notebook/mensuration.dart';


class Home extends StatefulWidget {
  FirebaseFirestore firestore  =FirebaseFirestore.instance;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      backgroundColor: Color.fromARGB(255,212,153,4),
      body: Center(
        child: SingleChildScrollView(
           padding:const EdgeInsets.symmetric(horizontal: 15),
           child:Container(
        margin: const EdgeInsets.all(9),
             
        
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
 
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5.0,  ), 
                    onPressed:  ()  {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mensuration ()));
                    }, 
                                      //loading ?null :sendOtpCode,  
                    child:const Text("Nouvelle commande",style: TextStyle(fontSize: 20),) ),
                     SizedBox(height: 20),
                     ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5.0,  ), 
                    
                    onPressed:  ()  {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HistoriqueCommande ()));
                    },
                    //loading ?null :sendOtpCode,  
                    child:const Text("Commandes",style: TextStyle(fontSize: 20),) )
                    ,
                     SizedBox(height: 20),

                    ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5.0,  ), // Elevation (shadow)
                       
                    onPressed:  ()  {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Rendez_vous ()));
                    },
                
                    //loading ?null :sendOtpCode,  
                    child:const Text("Rendez_vous",style: TextStyle(fontSize: 20),) ),
                    SizedBox(height: 20),
                    
                    ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5.0,  ), 
                    onPressed:  ()  {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cahier ()));
                    },
                    //loading ?null :sendOtpCode,  
                     child:const Text("Cahier de mesure",style: TextStyle(fontSize: 20),) )
                      ]
                       ),
                           ),
                             ),
                               ),
                         );
    
    
  }
}