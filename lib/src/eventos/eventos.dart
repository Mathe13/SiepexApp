import 'package:flutter/material.dart';

class EventosPage extends StatefulWidget {
  final Widget child;

  EventosPage({Key key, this.child}) : super(key: key);

  _EventosPageState createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Eventos'),
        ),
        body: ListView(
          children: <Widget>[
            eventoBanner(),
            eventoBanner(),
            eventoBanner(),
          ],
        ),
      ),
    );
  }

  Widget eventoBanner() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'agenda');
        },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
              child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage('assets/img/Untitled.png'),
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  child: Text(
                    'Evento',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ));
  }
}

// shape: RoundedRectangleBorder(
//     side: BorderSide(color: Colors.green, style: BorderStyle.solid),
//     borderRadius: BorderRadius.all(Radius.circular(20))),
