import 'package:flutter/material.dart';

class EventoButton extends StatefulWidget {
  final Widget child;

  EventoButton({Key key, this.child}) : super(key: key);

  _EventoButtonState createState() => _EventoButtonState();
}

class _EventoButtonState extends State<EventoButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('oi');
        },
        child: Card(
          color: Colors.grey[200],
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
                        Text(
                          'Autor da palestra',
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: ListTile(
                        title: Text('Uma palestra bacana e complexa'),
                        subtitle: Text('00:00-00:30\nPalco tal'),
                      )),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }
}
