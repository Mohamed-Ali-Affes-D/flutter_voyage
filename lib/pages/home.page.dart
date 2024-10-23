import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/drawer.widget.dart';

class HomePage extends StatelessWidget {
  @override
  late SharedPreferences prefs;
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Page Home',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.teal[200],
        elevation: 0,
      ),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/gallerie.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/gallerie');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/pays.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/pays');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/parametres.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/parametre');
              },
            ),
          ],
        ),
      ),
    );
  }
}
