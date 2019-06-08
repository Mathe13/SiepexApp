import 'package:flutter/material.dart';
import 'package:siepex/models/evento.dart';
import 'package:siepex/src/agenda/evento_card.dart';

class AgendaDia extends StatefulWidget {
  final Widget child;
  final List<Evento> eventos;
  AgendaDia({Key key, this.child, this.eventos}) : super(key: key);

  @override
  _AgendaDiaState createState() => _AgendaDiaState();
}

class _AgendaDiaState extends State<AgendaDia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: <Widget>[
                linhaHora(),
                EventoCard(
                  evento: new Evento(),
                ),
                EventoCard(evento: new Evento()),
                EventoCard(evento: new Evento()),
                linhaHora(),
                EventoCard(evento: new Evento()),
              ],
            )));
  }

  Widget linhaHora({String hora = "00:00"}) {
    return Container(
      width: 300,
      child: Text(
        hora,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.right,
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.green))),
    );
  }
}
