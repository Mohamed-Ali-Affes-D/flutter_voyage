import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';
import 'package:voyage/pages/home.page.dart';

class Pays extends StatelessWidget {
  const Pays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page Pays'),
        backgroundColor: Colors.teal[200],
      ),
      body: Center(
        child: Text(
          "Pays",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
