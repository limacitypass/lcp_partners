import 'package:flutter/material.dart';


class Visits extends StatelessWidget {

    TextStyle _tstyle = new TextStyle(
        color: new Color(0xFF5F5F5F),
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.bold,
        fontSize: 10.0,

    );
    
    TextStyle _vstyle = new TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
    );

    @override
    Widget build(BuildContext context) {
        return new Container(
            padding: new EdgeInsets.only(top:11.0, bottom: 20.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    new Column(
                        children: <Widget>[
                            new Text("TODAY VISITS",
                                style: _tstyle,               
                            ),
                            new Text("19",
                                style: _vstyle
                            ),
                        ],
                    ),
                    new Padding(
                        padding: new EdgeInsets.only(right: 27.0),
                    ),
                    new Column(
                        children: <Widget>[
                            new Text("TOTAL VISITS",
                                style: _tstyle,               
                            ),
                            new Text("210",
                                style: _vstyle
                            ),
                        ],
                    ),
                    new Padding(
                        padding: new EdgeInsets.only(right: 22.0),
                    ),
                    

                ],
            ),
        );
    }
}