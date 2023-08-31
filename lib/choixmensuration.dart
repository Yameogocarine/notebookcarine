import 'package:flutter/material.dart';
import 'mensuration.dart';
import 'mensurationFemme.dart';

class MensurationScreen extends StatefulWidget {
  @override
  _MensurationScreenState createState() => _MensurationScreenState();
}

class _MensurationScreenState extends State<MensurationScreen> {
  String _selectedGenre = ''; // Pour stocker le choix du genre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix des Mensurations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez le genre:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.man),
                  color: _selectedGenre == 'homme' ? Colors.blue : Colors.grey,
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Mensuration()));
                      },
                  
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.girl),
                  color: _selectedGenre == 'femme' ? Colors.pink : Colors.grey,
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MensurationFemmeScreen()));
                      
                  },
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
  }
  
