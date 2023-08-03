import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notebook/homescren.dart';  


import 'package:pinput/pinput.dart';

import 'function.dart';
import 'home.dart';

class VerificationOtp extends StatefulWidget {
  const VerificationOtp({Key?key,required this.verificationId,required  this.phoneNumber}):super(key: key);
  final String verificationId;
  final String phoneNumber;

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  String smsCode='';
  bool  loading=false;
  bool resend =false;
  int count=20;
  final _auth=FirebaseAuth.instance;
  @override
  void initState(){
    super.initState();
    decompte();
  }
  late Timer timer;
  void decompte(){
timer=Timer.periodic(Duration(seconds:1),(t){
if (count<1){
 timer.cancel();
 count=20;
 resend=true;
 setState(() {
   
 });
 return; 
}
count--;
setState(() {
  
});
});
  }
  void onResendSmsCode(){
    resend=false;
     setState(() {});
     authWhithPhoneNumber(widget.phoneNumber,onCodeSend:(verificationId,v)
      {
        loading=false;
        resend=false;
        decompte();
        setState(() {
          
        });
         },onAutoVerify: (v)async{
        await _auth.signInWithCredential(v);

      },
      onFailed:(e) {
        print("le code est erroné");
      },
      autoRetrieval: (v){}); 
    }
    void onVerifySmsCode()async{
loading=true;
setState(() {
  
});
await  validateOtp(smsCode,widget. verificationId);
   loading=true;
setState(() {
  
}); 
Navigator.of(context).pop(); 
print("Verification efectuer avec succes");}
        
      

  
  Widget build(BuildContext context) {
    print (widget.verificationId);
      return Scaffold(

        appBar: AppBar(
        title: const Text("Code de verification"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed:()async{ 
              await disconnect();
          }, icon:
          const Icon(Icons.superscript))
        ], 
      ),
      body: WillPopScope( onWillPop: () async {
          
        return true;
      },
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
            child:Container(
            margin: const EdgeInsets.all(9),
      
            color: Color.fromARGB(255, 212, 153, 4),
        
        child: Column(children: [
          const Text("Code OTP de Verification ",
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
    onCompleted :(value){
      smsCode=value;
      setState(() {
        
      });
    }
  ),
Align(
  alignment: Alignment.centerLeft,
  child: TextButton(
    onPressed:resend?null:onResendSmsCode, 
  child:  Text(!resend 
 ? "00:${count.toString().padLeft(2,"0")}"
  :"resend Code"),
    ),
),
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:[
     ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
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
 ],
   ),
    ]),
        ),
      ),),
    )
     );
  }
}

   /* ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15)
      ),
      onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homescren()));
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
)*/
   /* onPressed:(){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> 
Homescren ( )  )   );
    },
  child:const Text("Verifier",
         style: TextStyle(
          fontSize: 20
        ),*/ 
    /* smsCode.length<6  || !loading 
    ?null 
    :(){

    },*/

    //onVerifySmsCode,(){
      
    /*smsCode.length<6  || !loading 
    ?null:
    onVerifySmsCode, */
    
  
       /* child: loading
        ?const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation(Color.fromARGB(255, 6, 132, 235)),
         ):const Text("Verify",
         style: TextStyle(
          fontSize: 20
        ),
         ),
        ),
  ],
)*/

       
  

/*import 'package:flutter/material.dart';
import 'package:notebook/main.dart';

class VerificationOtp extends StatefulWidget {
  const VerificationOtp({super.key});

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  String smsCode ="";
  bool loading =false;
  bool resend=false;
  int count=20;

  @override
  void initState(){
    super.initState();

  }
  late Timer timer ;
  void dcompte(){
    timer =Timer.periodic(Duration(second:1.(t){
      if (count<1){
        timer.cancel();
        return;

      }

    }))
  }
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

  const Pinput(
    length:6,
    onChanged :(value){
      smsCode=value;
      setState(() {
        
      });
    }
  ),
Align(
  alignment: Alignment.centerLeft,
  child: TextButton(
    onPressed: !resend?null: onResendCode,

  (){}, 
  child:  Text(!resend 
 ? "00:§{count.toString().padLeft(2,"0")}"
  :"resend Code"),
    ),
),
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:[
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15)
      ),
      onPressed:()
      {
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyHomePage  ()));
      },
        child: const Text("Verify",style: TextStyle(
          fontSize: 20
        ),
        ) ,
        )
  ]
)

        ]),
        ),
      ),),
    );
  }
}*/
