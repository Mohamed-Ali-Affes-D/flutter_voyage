import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_pass = new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page Authentification',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[200],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Utilisateur",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_pass,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Mot de Passe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.teal[200],
              ),
              onPressed: () {
                _onAuthentifier(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Connection',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
          TextButton(
            child: Text(
              "Nouvel Utilisateur",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/inscription');
            },
          )
        ],
      ),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_pass.text.isEmpty) {
      if (prefs.get("login") == txt_login.text &&
          prefs.get("password") == txt_pass.text) {
        prefs.setBool("connecte", true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } else {
        const snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(
            child: Text('Email ou mot de passe invalide'),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
