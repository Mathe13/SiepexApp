import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siepex/models/evento.dart';
import 'package:siepex/models/palestrante.dart';
import 'package:siepex/src/agenda/evento_card.dart';

class PaletranteDetalhesPage extends StatefulWidget {
  final Palestrante palestrante;
  final Widget child;

  PaletranteDetalhesPage({Key key, this.child, this.palestrante})
      : super(key: key);

  _PaletranteDetalhesPageState createState() => _PaletranteDetalhesPageState();
}

class _PaletranteDetalhesPageState extends State<PaletranteDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/arte_uergs/Background_App_Siepex.png'),
                  fit: BoxFit.fill)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Um cara ai",
                    style: TextStyle(),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          width: 100,
                          height: 100,
                          decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new NetworkImage(
                                      "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, -0.4),
                            colors: <Color>[
                              Color(0x60000000),
                              Color(0x00000000)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: ListTile(
                          title: Text(
                        "Quem é um cara:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))),
                  ListTile(
                      title: Text.rich(TextSpan(
                          text:
                              """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."""))),
                  AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: ListTile(
                          title: Text(
                        "Palestras:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))),
                  EventoCard(evento: new Evento()),
                  EventoCard(evento: new Evento()),
                  EventoCard(evento: new Evento())
                ]),
              )
            ],
          )),
    );
  }
}
