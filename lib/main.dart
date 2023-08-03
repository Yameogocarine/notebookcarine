

//import 'package:book/Camera.dart';
//code bon non touche
// 
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

 //code pour essaie qui marche a revoir
 /*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notebook/Cahier.dart';
import 'function.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final TextEditingController dosController = TextEditingController();
final TextEditingController epauleController = TextEditingController();
final TextEditingController poitrineController = TextEditingController();

  void _addMensuration() {
   
  String dos = dosController.text;
  String epaule = epauleController.text;
  String poitrine = poitrineController.text;
  
  if (
      dos.isNotEmpty &&
      epaule.isNotEmpty &&
      poitrine.isNotEmpty 
      ) {

      FirebaseFirestore.instance.collection('mensurations').add({
      
      'dos': dos,
      'epaule': epaule,
      'poitrine': poitrine,
      
     });

    
    // Effacez les contrôleurs de texte après l'enregistrement
    
    dosController.clear();
    epauleController.clear();
    poitrineController.clear();
    
  }
}
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
      
    
    body:
            Padding(
              padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
         TextFormField(
                controller:dosController,
                decoration: const InputDecoration(
                 labelText: 'Dos',
                  border: OutlineInputBorder(),
                  
                 
                ),
              ),
            
        
           
               TextFormField(
                controller:epauleController,
                decoration: const InputDecoration(
                 labelText: 'Epaule',
                  border: OutlineInputBorder(),
                  
                 
                ),
              ),
            
            TextFormField(
                 controller:poitrineController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Poitrine',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            
           
      SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addMensuration,
              child: Text('Ajouter'),
            ),
           SizedBox(height: 16),
           ElevatedButton(onPressed: (){
             
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cahier()));
               // Utilisez la classe UserListPage ici
            

           }, child: Text('Mon cahier de mesure'),)
           
             ]
           )
            )
             );
        
     
  }
}*/
             
  //jarrive
  //StreamBuilder<QuerySnapshot>(
  /*stream: FirebaseFirestore.instance.collection('mensurations').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Afficher un indicateur de chargement en attendant les données
    }
    
    if (!snapshot.hasData) {
      return Text('Aucune donnée trouvée'); // Si aucune donnée n'est disponible
    }

    final mensurations = snapshot.data.docs; // Liste de documents de Firebase
    
    return ListView.builder(
      itemCount: mensurations.length,
      itemBuilder: (context, index) {
        final mensuration = mensurations[index].data() as Map<String, dynamic>;
        final dos = mensuration['dos'];
        final epaule = mensuration['epaule'];
        final poitrine = mensuration['poitrine'];
        // Répétez pour les autres champs de mensuration
        
        return ListTile(
          title: Text('Dos: $dos - Epaule: $epaule - Poitrine: $poitrine'), // Personnalisez l'affichage en fonction de vos besoins
        );
      },
    );
  },
), 
   ],   
    
   )
            ),
          
        ),
      );
   
  }
}*/


/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  void _addUser() {
    String username = _usernameController.text;
    String firstName = _firstNameController.text;

    if (username.isNotEmpty && firstName.isNotEmpty) {
      FirebaseFirestore.instance.collection('users').add({
        'username': username,
        'firstName': firstName,
      });

      _usernameController.clear();
      _firstNameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Ajouter'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Une erreur est survenue');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final users = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index].data() as Map<String, dynamic>;
                      final username = user['username'];
                      final firstName = user['firstName'];

                      return ListTile(
                        title: Text('$username - $firstName'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
//le code pour essaue

//import 'package:firebase_auth/firebase_auth.dart';
//code bon a ne pas toucher

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notebook/Sign-in.dart';
 
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notebook/home.dart';
import 'function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  );
  runApp(MyApp());
}
//import 'package:notebook/home.dart';
//import 'package:firebase_core/firebase_core.dart';



//import 'package:notebook/Sign-in.dart';


// web_entrypoint.dart



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
       MyHomePage(title: 'Cahier de mesure'),
    );
     
 
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
 
      appBar: AppBar(
        
title: Text(widget.title),
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
     
      ),
      backgroundColor: Color.fromARGB(255,212,153,4),
      body: SingleChildScrollView(    
       child:Container(
        margin: const EdgeInsets.all(9),
       color: Color.fromARGB(255, 212, 153, 4),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
           
              Image.asset(
                "asset/remov.png",
                fit: BoxFit.cover,
              ),
    /*  StreamBuilder<User?>(stream: _auth.authStateChanges()
      ,builder: (context,snapshot){
        return snapshot.data==null?const SignInView():const Home();
      },),*/
      
           ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInView()));
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // Couleur de fond bleue
  ),
  child: Text(
    "Cliquez ici pour se connecter",
    style: TextStyle(
      color: Colors.white, // Texte en blanc
    ),
  ),
)




           
         ] 

      )
       
      
      ), // This trailing comma makes auto-formatting nicer for build methods.
    )
      );
  }
}

