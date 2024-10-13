import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';
import 'package:voyage/pages/home.page.dart';

class Gallerie extends StatelessWidget {
  const Gallerie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page Gallerie'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Text("Gallerie", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
