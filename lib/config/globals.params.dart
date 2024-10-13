import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> mexus = [
    {
      "title": "Accueil",
      "icon": Icon(
        Icons.home,
        color: Colors.teal,
      ),
      "route": "/home"
    },
    {
      "title": "Météo",
      "icon": Icon(
        Icons.sunny_snowing,
        color: Colors.teal,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": Icon(
        Icons.photo,
        color: Colors.teal,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": Icon(
        Icons.location_city,
        color: Colors.teal,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": Icon(
        Icons.contact_page,
        color: Colors.teal,
      ),
      "route": "/contact"
    },
    {
      "title": "Parametres",
      "icon": Icon(
        Icons.settings,
        color: Colors.teal,
      ),
      "route": "/parametre"
    },
    {
      "title": "Deconnexion",
      "icon": Icon(
        Icons.logout,
        color: Colors.teal,
      ),
      "route": "/authentification"
    },
  ];
}
