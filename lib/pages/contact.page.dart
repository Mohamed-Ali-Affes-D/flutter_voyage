import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page Contact'),
        backgroundColor: Colors.teal[200],
      ),
      body: Center(
        child: Text("Contact", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
