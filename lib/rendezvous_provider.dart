/*import 'package:flutter/foundation.dart';
import 'rendez-vous.dart';
import 'rendez_vousfiretore.dart';

class RendezVousProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<RendezVous> _listeRendezVous = [];

  List<RendezVous> get listeRendezVous => _listeRendezVous;

  void ajouterRendezVous(RendezVous rendezVous) {
    _firestoreService.ajouterRendezVous(rendezVous);
  }

  void obtenirRendezVous() {
    _firestoreService.obtenirRendezVous().listen((rendezVousData) {
      _listeRendezVous = rendezVousData;
      notifyListeners();
    });
  }
}*/
