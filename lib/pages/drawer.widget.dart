import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/globals.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    late SharedPreferences prefs;
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Colors.teal])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/daly.jpg"),
                radius: 80,
              ),
            ),
          ),
          ...(GlobalParams.mexus as List).map(
            (item) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${item['title']}',
                      style: TextStyle(fontSize: 22),
                    ),
                    leading: item['icon'],
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.blue,
                    ),
                    onTap: () async {
                      if ('${item['title']}' != "Deconnexion") {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "${item['route']}");
                      } else {
                        prefs = await SharedPreferences.getInstance();
                        prefs.setBool(('connecte'), false);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/authentification',
                            (Route<dynamic> route) => false);
                      }
                    },
                  ),
                  Divider(
                    height: 4,
                    color: Colors.blue,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
