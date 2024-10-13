import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';

class parametre extends StatelessWidget {
  const parametre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Page Parametre',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.teal[200],
      ),
      body: Center(
          child: Text(
        "Parametre",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
