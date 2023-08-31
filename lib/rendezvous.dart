/*import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Selected Date: ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'rendez-vous.dart';
import 'rendezvous_provider.dart';

class RendezVousPage extends StatelessWidget {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final rendezVousProvider = Provider.of<RendezVousProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Gestion des Rendez-vous')),
      body: Column(
        children: [
          TextField(controller: _titreController, decoration: InputDecoration(labelText: 'Titre')),
          TextField(controller: _dateController, decoration: InputDecoration(labelText: 'Date')),
          ElevatedButton(
            onPressed: () {
              final rendezVous = RendezVous(
                id: DateTime.now().toString(),
                titre: _titreController.text,
                date: DateTime.parse(_dateController.text),
                estCritique: false,
              );
              rendezVousProvider.ajouterRendezVous(rendezVous);
              _titreController.clear();
              _dateController.clear();
               } ),
                 ]  
                  //  )*/
/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  // Utilisez pickedDate comme DateTime non nul

              
                  setState(() {
                    selectedDate = pickedDate;
                    _controller.text = pickedDate.toString();
                  });
                }
              },
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
}*/
