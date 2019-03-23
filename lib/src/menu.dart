import 'package:flutter/material.dart';

Widget menu(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the Drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      // padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Image.asset(
            'assets/img/download.jpeg',
            fit: BoxFit.cover,
            // height: 120,
          ),
          decoration: BoxDecoration(
              // color: Colors.blue,
              ),
        ),
        ListTile(
          title: Text('Inicio'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Mapa'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
