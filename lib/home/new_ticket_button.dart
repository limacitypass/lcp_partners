import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as fa;

class NewTicketButton extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return new GestureDetector(
            onTap: () {
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("Pressed"),duration: new Duration(seconds: 1),)
                );
            },
            child: new Container(
            height: 48.0,
            decoration: new BoxDecoration(
            color: new Color(0xFF5259F6),
            ),
            
            child: new Center(
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new Icon(
                    fa.FontAwesomeIcons.camera, 
                    color: Colors.white,
                    size: 23.0,
                ), 
                new Padding(padding: new EdgeInsets.only(right: 14.0),),
                new Text(
                    "REGISTER NEW TICKET",
                    style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                    ),
                )
                ],
            )
            )
        ),
      );
    }
}