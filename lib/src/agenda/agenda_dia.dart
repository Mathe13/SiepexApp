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
            padding: EdgeInsets.all(20),
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

  Widget linhaHora() {
    return Container(
      width: 300,
      child: Text(
        '00:00',
        style: TextStyle(color: Colors.grey[400], fontSize: 25),
        textAlign: TextAlign.right,
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.green))),
    );
  }

  // Widget eventoCard(Evento evento) {
  //   double c_width = MediaQuery.of(context).size.width * 0.8;

  //   return Center(
  //       child: Container(
  //     padding: EdgeInsets.only(top: 10),
  //     decoration: ShapeDecoration(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20)),
  //             side: BorderSide(color: Colors.green)),
  //         color: Colors.grey[200]),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Row(
  //           children: <Widget>[
  //             Column(
  //               children: <Widget>[
  //                 Container(
  //                     margin: EdgeInsets.only(left: 20, right: 10, top: 15),
  //                     width: 70,
  //                     height: 70,
  //                     decoration: new BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         image: new DecorationImage(
  //                             fit: BoxFit.cover,
  //                             image: new NetworkImage(
  //                                 "https://avatars0.githubusercontent.com/u/29609021?s=400&u=be91d738c1796c1f523b5c630c1359956d170ccb&v=4"))))
  //               ],
  //             ),
  //             Column(
  //               children: <Widget>[Text('text'), Text('oi')],
  //             )
  //           ],
  //         ),
  //         ButtonTheme.bar(
  //           // make buttons use the appropriate styles for cards
  //           child: ButtonBar(
  //             children: <Widget>[
  //               FlatButton(
  //                 child: const Text('Detalhes'),
  //                 onPressed: () {
  //                   Dialogos.naoImplementado(context);
  //                 },
  //               ),
  //               FlatButton(
  //                 child: const Text('Registrar'),
  //                 onPressed: () {
  //                   Dialogos.naoImplementado(context);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   )
  //       // ),
  //       );
  // }
}
