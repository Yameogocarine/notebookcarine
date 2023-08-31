import 'package:flutter/material.dart';
import 'package:notebook/function.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:notebook/verification_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';  
class SignInView extends StatefulWidget {
  const SignInView({super.key});
  @override
  State<SignInView> createState() => _SignInViewState();
}
class _SignInViewState extends State<SignInView> {
  bool loading =false;
  String phoneNumber='';
  void sendOtpCode(){
    loading=true; 
    final _auth =FirebaseAuth.instance;
    if (phoneNumber.isNotEmpty){
      authWhithPhoneNumber(phoneNumber,
      onCodeSend: (verificationId,v){
        loading=false;
        setState(() {  
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (c) =>  VerificationOtp (
          verificationId :verificationId,
          phoneNumber: phoneNumber,
        )));
      },
      onAutoVerify: (v)async{
        await _auth.signInWithCredential(v);

      },
      onFailed:(e) {
        print("le code est erroné");
      },
      autoRetrieval: (v){}); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton( 
            onPressed:()async{ 
              await disconnect();
          }, icon:
          const Icon(Icons.verified_user_sharp))
        ], 
      ),
      backgroundColor: Color(0xFFF1890B),
      body: Center(
        child: SingleChildScrollView(
           padding:const EdgeInsets.symmetric(horizontal: 15),
           child:Container(
        margin: const EdgeInsets.all(9),
      
          color:Color(0xFFF1890B),
        
           child: Column(
            children: [
              const Text( "Connectez_vous",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:Colors.blue,
              ),
              ),
              const SizedBox( height:40,
              ),
              
              IntlPhoneField(
               initialCountryCode:"BF" ,
                onChanged: (value){
                 print (value.completeNumber );
                 phoneNumber=value.completeNumber; 
                },
                decoration:
                const InputDecoration (border:OutlineInputBorder()),
                
              ),
              const SizedBox(
                height: 20
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed:  
                      loading ?null :sendOtpCode,
                     
                    child:loading?
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    )
                    :const Text("Connecter",style: TextStyle(fontSize: 20,color: Colors.white),) )
                ],
              )
            ],
           ),),
      ),
    )
      );
  }
}