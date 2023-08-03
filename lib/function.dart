// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
final _auth=FirebaseAuth.instance;
void authWhithPhoneNumber(String phone ,
{required Function (String value, int?value1)onCodeSend,
required Function (PhoneAuthCredential value )onAutoVerify,
required Function (FirebaseAuthException value )onFailed,  
required Function ( String value )autoRetrieval}  ) async{
  final _auth=FirebaseAuth.instance;
  _auth.verifyPhoneNumber(
    phoneNumber:phone,
    timeout:  Duration(seconds:20),
    verificationCompleted:onAutoVerify,
    verificationFailed: onFailed,
    codeSent: onCodeSend,
    codeAutoRetrievalTimeout: autoRetrieval ) ;
  

} 
Future <void> validateOtp (String smsCode, String verificationId  )async{
  final _credential= PhoneAuthProvider.credential(
    verificationId:verificationId,smsCode:smsCode );
    await _auth.signInWithCredential(_credential);
    return;
  
}
Future <void> disconnect() async {
  await _auth.signOut();
  return;
}

void enregistrerTexte(String texte) {
  // Récupère la référence de la collection "textes"
  CollectionReference textesCollection =
      FirebaseFirestore.instance.collection('textes');

  // Ajoute le texte dans la collection "textes"
  textesCollection.add({
    'texte': texte,
    'timestamp': FieldValue.serverTimestamp(), // Ajoute un timestamp pour enregistrer la date et l'heure de l'enregistrement
  }).then((value) {
    print('Texte enregistré avec succès !');
  }).catchError((error) {
    print('Erreur lors de l\'enregistrement du texte : $error');
  });
}
