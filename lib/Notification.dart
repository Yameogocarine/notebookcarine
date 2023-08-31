/*import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'rendez-vous.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Traitez la notification push reçue ici
}
void saveAppointment() {
  if (selectedDate != null) {
    FirebaseFirestore.instance.collection('appointments').add({
      'date': selectedDate,
    }).then((value) {
      print("Rendez-vous enregistré avec succès");
      
      // Calcul de la date pour envoyer la notification (1 jour avant)
      DateTime notificationDate = selectedDate.subtract(Duration(days: 1));
      
      // Envoyer la notification
      sendNotification(notificationDate);
    }).catchError((error) {
      print("Erreur lors de l'enregistrement du rendez-vous : $error");
    });
  }
}


void sendNotification(DateTime notificationDate) async {
  String serverToken = 'YOUR_SERVER_TOKEN'; // Obtenez ce token depuis la console Firebase

  await FirebaseMessaging.instance.subscribeToTopic('appointments');
  
  await FirebaseMessaging.instance.send(
    RemoteMessage(
      notification: RemoteNotification(
        title: 'Rappel de rendez-vous',
        body: 'Votre rendez-vous est demain !',
      ),
      data: <String, String>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      },
      topic: 'appointments',
      scheduleTime: notificationDate,
    ),
  );
}*/
