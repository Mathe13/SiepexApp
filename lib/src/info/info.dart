import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:siepex/mdi.dart';
import 'package:siepex/utils/percentage_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  final Widget child;

  InfoPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Informações úteis'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                linhaDesc('Telefones'),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    itemButton('Bombeiros', Mdi.fire_truck, 'tel:513327-2132'),
                    itemButton('Policia', Mdi.security, 'tel:190'),
                    itemButton('Samu', Mdi.hospital, 'tel:5132892541')
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                linhaDesc('Transporte'),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    itemButton('Trensurb', Mdi.train,
                        'http://trensurb.gov.br/paginas/paginas_detalhe.php?codigo_sitemap=18'),
                    itemButton('Ônibus', Mdi.bus_side,
                        'http://www2.portoalegre.rs.gov.br/eptc/default.php?p_secao=158'),
                    itemButton('Rodoviaria', Mdi.bus_articulated_front,
                        'http://www.rodoviaria-poa.com.br/inicio.php')
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget linhaDesc(String texto) {
    return Container(
      width: 300,
      child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Text(
            texto,
            style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic),
            textAlign: TextAlign.right,
          )),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.green),
        // top: BorderSide(color: Colors.green)
      )),
    );
  }

  Widget itemButton(String nome, IconData icone, String url) {
    return Expanded(
        flex: 1,
        child: FlatButton(
          onPressed: () async {
            if (await canLaunch(url)) {
              launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
              // height: PercentageHelper.height(17, context),
              // width: PercentageHelper.width(35, context),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Color(0xff249FAB),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  Icon(
                    icone,
                    size: 70,
                    color: Colors.white,
                  ),
                  Text(
                    nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.white),
                    softWrap: true,
                  )
                ],
              )),
        ));
  }
}
