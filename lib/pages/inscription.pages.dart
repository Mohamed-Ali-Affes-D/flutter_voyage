import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  TextEditingController txtlogin = new TextEditingController();
  TextEditingController txtpass = new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inscription',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[300],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtlogin,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Utilisateur",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtpass,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  hintText: "Mot de Passe",
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
                _onInscrire(context);
              },
              child: const Text(
                'Inscription',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          TextButton(
            child: const Text(
              "J'ai un Compte",
              style: TextStyle(fontSize: 22, color: Colors.teal),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/authentification');
            },
          )
        ],
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();

    if (txtlogin.text.isNotEmpty && txtpass.text.isNotEmpty) {
      if (prefs.get("login") == txtlogin.text) {
        const snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(child: Text('Utilisateur existe')),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/authentification');
      } else {
        prefs.setString("login", txtlogin.text);
        prefs.setString("password", txtpass.text);

        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Text(
              'Utilisateur créé',
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/authentification');
      }
    } else {
      const snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(child: Text('Email ou mot de passe requis')),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
