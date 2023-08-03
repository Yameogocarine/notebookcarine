/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'rendez-vous.dart';
class FirestoreService {
  final CollectionReference _rendezVousCollection =
      FirebaseFirestore.instance.collection('rendezvous');

  Future<void> ajouterRendezVous(RendezVous rendezVous) async {
    try {
      await _rendezVousCollection.add(rendezVous.toMap());
    } catch (e) {
      // Gérer les erreurs ici
    }
  }

  Stream<List<RendezVous>> obtenirRendezVous() {
    return _rendezVousCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => RendezVous.fromMap(doc.data())).toList();
    });
  }
}
*/