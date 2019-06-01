import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:siepex/mdi.dart';
import 'package:siepex/src/inicio/itemButton.dart';

class AlimentacaoPage extends StatefulWidget {
  AlimentacaoPage({Key key}) : super(key: key);

  _AlimentacaoPageState createState() => _AlimentacaoPageState();
}

class _AlimentacaoPageState extends State<AlimentacaoPage> {
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print(barcode);
      // return barcode;
    } catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('erro');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alimentacao"),
        // actions: <Widget>[Text("Restante:6")],
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/arte_uergs/Background_App_Siepex.png'),
                  fit: BoxFit.cover)),
          // margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: <Widget>[
              blocoLeitura(context),
              Card(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
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
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                    // Padding(
                    //   padding: EdgeInsets.all(5),
                    // ),
                    tabelaHistorico()
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget blocoLeitura(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 40, right: 40),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Text(
            "Adicionar Nova entrada",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              itemButton(
                  new GridItem(
                    'Escanear',
                    'rota',
                    Mdi.qrcode,
                  ),
                  context,
                  func: scan,
                  function: true),
              itemButton(new GridItem('Manual', 'rota', Mdi.hand), context)
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
        ]));
  }

  Widget tabelaHistorico() {
    return Container(
        // padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Data/Hora')),
                DataColumn(label: Text('Tipo')),
                DataColumn(
                  label: Text('Refeição'),
                ),
              ],
              rows: [],
            )));
  }
}
