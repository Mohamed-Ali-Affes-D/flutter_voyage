import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';
import 'package:voyage/pages/home.page.dart';

class Meteo extends StatelessWidget {
  const Meteo({super.key});

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
      body: Center(
          child: Text(
        "Meteo",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
