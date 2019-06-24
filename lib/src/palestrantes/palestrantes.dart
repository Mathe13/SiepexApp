import 'package:flutter/material.dart';
import 'package:siepex/models/palestrante.dart';
import 'package:siepex/src/palestrantes/palestrantes_detalhes.dart';

class PalestrantesPage extends StatefulWidget {
  final Widget child;

  PalestrantesPage({Key key, this.child}) : super(key: key);

  _PalestrantesPageState createState() => _PalestrantesPageState();
}

class _PalestrantesPageState extends State<PalestrantesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Palestrantes do ano'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('pesquisa palestrantes');
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/arte_uergs/Background_App_Siepex.png'),
                  fit: BoxFit.fill)),
          // margin: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Principais palestrantes',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              Expanded(
                flex: 1,
                child: honrados(context),
              ),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Palestrantes',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: palestrantesList(context),
              ),
            ],
          ),
        ));
  }
}

Widget palestrantesList(BuildContext context) {
  return ListView(
    padding: EdgeInsets.all(0),
    children: <Widget>[
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
      palestranteLinha(new Palestrante(), context),
    ],
  );
}

Widget palestranteLinha(Palestrante palestrante, BuildContext context) {
  return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaletranteDetalhesPage(
                      palestrante: new Palestrante(),
                    )));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 3),
                width: 40,
                height: 40,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
            Text('um nome')
          ],
        ),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[600]))),
      ));
}

Widget honrados(BuildContext context) {
  return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        honradoCard(new Palestrante(), context),
        honradoCard(new Palestrante(), context),
        honradoCard(new Palestrante(), context),
        honradoCard(new Palestrante(), context)
      ]);
}

Widget honradoCard(Palestrante honrado, BuildContext context) {
  return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaletranteDetalhesPage(
                      palestrante: new Palestrante(),
                    )));
      },
      child: new Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              width: 100,
              height: 100,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
          new Text("John Doe", textScaleFactor: 1.5),
        ],
      ));
}
