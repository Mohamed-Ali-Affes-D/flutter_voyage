import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voyage/pages/drawer.widget.dart';
import 'package:http/http.dart' as http;

class MeteoDetailsPage extends StatefulWidget {
  String ville = "";
  MeteoDetailsPage(this.ville);

  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  @override
  var meteoData;
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Méteo de la ville de" + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      this.meteoData = json.decode(resp.body);
      print(this.meteoData);
    }).catchError((err) {
      print(err);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Meteo Details ${widget.ville}'),
          backgroundColor: Colors.teal[200],
        ),
        body: Center(
          child: Text('Page Meteo Details ${widget.ville}'),
        ));
  }
}
