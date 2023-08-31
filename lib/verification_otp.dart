import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      backgroundColor: Color(0xFFF1890B),
      body: WillPopScope( onWillPop: () async {
          
        return true;
      },
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
            child:Container(
            margin: const EdgeInsets.all(9),
      
            color: Color(0xFFF1890B),
        
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
    "Valider",
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

   