import 'package:flutter/material.dart';
import 'package:notebook/mensuration.dart';
import 'package:pinput/pinput.dart';
class Commande extends StatefulWidget {
  const Commande({super.key});

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope( onWillPop: () async {
        return true;
      },
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          const Text("Verification Otp",
          style: 
          TextStyle(fontSize: 14,
          color:Colors.blue  ),
),
const Text
("Check your message to validate",
style: TextStyle(
  fontSize: 14,
  color:Colors.blue,

),
),
const SizedBox(
  height: 20,  ),
  Pinput(
    length:6,
   
  ),

   
Align(
  alignment: Alignment.centerLeft,
  child: TextButton(
    onPressed:() {}, 
  child:  Text(
  "resend Code"),
    ),
),
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:[
    ElevatedButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Mensuration ()));
    },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15)
      ),
    
    
  
        child: 
        const Text("Verify",
         style: TextStyle(
          fontSize: 20
        ),
         ),
        ),
  ],
)

        ]),
        ),
      ),),
    );
    
    
    
  }
}