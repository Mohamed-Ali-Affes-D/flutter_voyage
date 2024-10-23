import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/meteo-details.page.dart';

class Meteo extends StatelessWidget {
  TextEditingController txt_ville = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'Page Meteo',
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Colors.teal[200],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_ville,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.villa),
                    hintText: "Ville",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.teal[300]),
                onPressed: () {
                  _onGetMeteoDetails(context);
                },
                child: const Text(
                  'Recherche',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;

    if (v.isNotEmpty) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MeteoDetailsPage(v)));
    } else {
      const snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(child: Text('Ville requis')),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
