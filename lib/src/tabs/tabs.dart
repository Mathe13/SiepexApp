import 'package:flutter/material.dart';
import 'package:siepex/src/agenda/agenda.dart';
import 'package:siepex/src/menu.dart';
import 'package:siepex/src/palestrantes/palestrantes.dart';
import 'package:siepex/src/sobre/sobre.dart';

class TabsPage extends StatefulWidget {
  final Widget child;

  TabsPage({Key key, this.child}) : super(key: key);

  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<String> titulos = ['Agenda', 'Palestrantes', 'Sobre o evento'];
  final _widgetOptions = [
    AgendaPage(),
    PalestrantesPage(),
    SobrePage(),
  ];
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appbars.elementAt(_selectedIndex),
      drawer: menu(context),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Programação')),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text('Palestrantes')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Sobre'))
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    print('apertou');
    setState(() {
      _selectedIndex = index;
    });
  }
}
