import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siepex/models/palestrante.dart';

class EventoDetalhes extends StatefulWidget {
  final Widget child;

  EventoDetalhes({Key key, this.child}) : super(key: key);

  _EventoDetalhesState createState() => _EventoDetalhesState();
}

class _EventoDetalhesState extends State<EventoDetalhes> {
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
                    "Palestra bacana",
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
                        "Descrição:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))),
                  ListTile(
                      title: Text.rich(TextSpan(
                          text:
                              """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. """))),
                  AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: ListTile(
                          title: Text(
                        "Horario:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))),
                  ListTile(
                    title: Text('Dia 1'),
                    subtitle: Text('00:00-00:30'),
                  ),
                  AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: ListTile(
                          title: Text(
                        "Palestrante(s):",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))),
                  palestranteCard(new Palestrante(), context)
                ]),
              )
            ],
          )),
    );
  }

  Widget palestranteCard(Palestrante palestrante, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EventoDetalhes()));
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Color(0xff2595A6),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                            // margin: EdgeInsets.only(left: 20, right: 10, top: 15),
                            width: 70,
                            height: 70,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new NetworkImage(
                                        "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
                        // Text(
                        //   'Autor da palestra',
                        //   textAlign: TextAlign.center,
                        // )
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: ListTile(
                        title: Text('Nome do palestrante'),
                        subtitle: Text('n palestras'),
                      )),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }
}
