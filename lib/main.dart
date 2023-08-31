import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notebook/Sign-in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notebook/home.dart';
import 'commande.dart';
import 'function.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(   
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      ),
      backgroundColor: Color(0xFFF1890B),
      body: SingleChildScrollView(    
       child:Container(
        margin: const EdgeInsets.all(9),
       color:  Color(0xFFF1890B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset(
                "asset/remov.png",
                fit: BoxFit.cover,
              ),

           ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
    SignInView()));
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // Couleur de fond bleue
  ),
  child: Text(
    "Commencer!",
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
//CODE A NE PAS TOUCHER

