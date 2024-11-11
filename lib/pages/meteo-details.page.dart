import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    print("Méteo de la ville de $ville");
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$ville&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        meteoData = json.decode(resp.body);
      });
      print(meteoData);
    }).catchError((err) {
      print(err);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Meteo Details'),
        backgroundColor: Colors.teal[200],
      ),
      body: meteoData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: (meteoData == null ? 0 : meteoData['list'].length),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${new DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000))} - ${meteoData['list'][index]['weather'][0]['description']}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "${(double.parse(meteoData['list'][index]['main']['temp'].toString()) - 273.15).toInt()} °C",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
