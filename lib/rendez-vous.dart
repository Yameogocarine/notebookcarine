import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HistoriqueRendez.dart';
class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime selectedDate=DateTime.now();
  final TextEditingController _controller = TextEditingController();

  void saveAppointment() {
    if (selectedDate != null) {
      FirebaseFirestore.instance.collection('appointments').add({
        'date': selectedDate,
      }).then((value) {
        print("Rendez-vous enregistré avec succès");
      }).catchError((error) {
        print("Erreur lors de l'enregistrement du rendez-vous : $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rendez-vous'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
  // ...
);

                
if (pickedDate != null) {
   setState(() {
                    selectedDate = pickedDate;
                    _controller.text = pickedDate.toString();
                  });
                }
              },
  // Utilisez pickedDate comme DateTime non nul

                 
              child: Text('Sélectionner un rendez-vous'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date du rendez-vous',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveAppointment,
              child: Text('Enregistrer le rendez-vous'),
            ),
          ],
        ),
      ),
    );
  }
}
