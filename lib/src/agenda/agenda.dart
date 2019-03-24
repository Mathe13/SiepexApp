import 'package:flutter/material.dart';
import 'package:siepex/src/agenda/agenda_dia.dart';

class AgendaPage extends StatefulWidget {
  final Widget child;

  AgendaPage({Key key, this.child}) : super(key: key);

  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Agenda do evento'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('pesquisa');
                },
              )
            ],
            bottom: tabs(),
          ),
          body: TabBarView(
            children: <Widget>[
              AgendaDia(),
              AgendaDia(),
              AgendaDia(),
            ],
          ),
        ));
  }

  Widget tabs() {
    return TabBar(indicatorColor: Colors.white,
        // labelPadding: EdgeInsets.zero,
        tabs: [
          Tab(child: Text("Dia 1")),
          Tab(child: Text("Dia2")),
          Tab(child: Text("Dia3"))
        ]);
  }
}