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
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            child: ListView(
              children: <Widget>[
                eventoBanner('Geral', url: 'geral'),
                eventoBanner('Minicursos', url: "minicursos"),
                eventoBanner('Visitas Técnicas', url: 'visitas'),
                eventoBanner('Trabalhos', url: 'trabalhos'),
              ],
            )),
      ),
    );
  }

  Widget eventoBanner(String title, {String url = "agenda"}) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, url);
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
                child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          )),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 200,
          margin: EdgeInsets.all(10),
        ));
  }
}

// shape: RoundedRectangleBorder(
//     side: BorderSide(color: Colors.green, style: BorderStyle.solid),
//     borderRadius: BorderRadius.all(Radius.circular(20))),
