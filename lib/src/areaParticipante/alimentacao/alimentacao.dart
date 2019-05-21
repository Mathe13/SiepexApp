import 'package:flutter/material.dart';
import 'package:siepex/mdi.dart';
import 'package:siepex/src/inicio/itemButton.dart';

class AlimentacaoPage extends StatefulWidget {
  AlimentacaoPage({Key key}) : super(key: key);

  _AlimentacaoPageState createState() => _AlimentacaoPageState();
}

class _AlimentacaoPageState extends State<AlimentacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alimentacao"),
        // actions: <Widget>[Text("Restante:6")],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: <Widget>[
              blocoLeitura(context),
              Card(
                margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text('Histórico',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17)),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    tabelaHistorico()
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget tabelaHistorico() {
  return Container(
      padding: EdgeInsets.all(5),
      child: DataTable(
        columns: [
          DataColumn(label: Text('Data/Hora')),
          DataColumn(label: Text('Tipo')),
          DataColumn(
            label: Text('Refeição'),
          ),
        ],
        rows: [],
      ));
}

Widget blocoLeitura(BuildContext context) {
  return Card(
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(5),
        ),
        Text(
          "Adicionar Nova entrada",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            itemButton(new GridItem('Escanear', 'rota', Mdi.qrcode), context),
            itemButton(new GridItem('Manual', 'rota', Mdi.hand), context)
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
      ]));
}
