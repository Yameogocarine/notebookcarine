import 'package:flutter/material.dart';
import 'package:notebook/function.dart';
class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: const Text("Login form"),
        actions: [
          IconButton(
            onPressed:()async{ 
              await disconnect();
          }, icon:
          const Icon(Icons.power))
        ], 
      ),
     backgroundColor: Color.fromARGB(255,212,153,4), 
     body: Center(
        child: SingleChildScrollView(
           padding:const EdgeInsets.symmetric(horizontal: 15),
           child: Column(
            children: [
              const Text( "Sign in",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:Colors.blue,
              ),
              ),
                ]
              ) 
                ) 
                  )
                    );
  }
}