import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signUp(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Le compte a été créé avec succès
  } catch (e) {
    // Gérer les erreurs
  }
}


FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> updateWorkshopInfo(String userId, String logoUrl, String color) async {
  try {
    await _firestore.collection('workshops').doc(userId).update({
      'logo': logoUrl,
      'color': color,
    });
  } catch (e) {
    // Gérer les erreurs
  }
}
Future<void> grantAccessToColleague(String workshopId, String colleagueId) async {
  try {
    await _firestore.collection('workshops').doc(workshopId).collection('colleagues').doc(colleagueId).set({
      // Les informations du collègue ou les permissions
    });
  } catch (e) {
    // Gérer les erreurs
  }
}
