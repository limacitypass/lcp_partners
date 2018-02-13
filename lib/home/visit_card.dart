import 'package:flutter/material.dart';
import '../types.dart';

class VisitCard extends StatelessWidget {
  TicketVisitCard _visit;
  VisitCard(this._visit);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top:6.0, bottom: 6.0),
      child: new Material(
        color: Colors.white,
        elevation: 4.0,
        borderRadius: new BorderRadius.circular(4.0),
        child: new Container(
          margin: new EdgeInsets.all(9.0),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                radius: 25.0,
                backgroundImage: new NetworkImage(this._visit.user.photo),
              ),
              new Padding(
                padding: new EdgeInsets.only(left: 30.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(this._visit.user.name,
                      style: new TextStyle(
                        color: new Color(0xFF5F5F5F),
                        fontFamily: 'Quicksand',
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                      ),

                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 2.5, bottom: 2.5),
                    ),
                    new Text(this._visit.user.email,
                      style: new TextStyle(
                        color: new Color(0xFF5F5F5F),
                        fontFamily: 'Quicksand',
                        fontSize: 11.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                  ],
                ),
              ),

              new Expanded(
                child: new Container(
                  alignment: Alignment.centerRight,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("${_n2t(this._visit.visitTime.hour)}:${_n2t(this._visit.visitTime.minute)}",
                        style: new TextStyle(
                          color: new Color(0xFF5F5F5F),
                          fontFamily: 'Quicksand',
                          fontSize: 21.0,
                          fontWeight: FontWeight.w400,
                        ),
                        
                      ),
                      new Text("${_n2t(this._visit.visitTime.month)}/${_n2t(this._visit.visitTime.day)}/${_n2t(this._visit.visitTime.year)}",
                        style: new TextStyle(
                          color: new Color(0xFF5F5F5F),
                          fontFamily: 'Quicksand',
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ),
              )
              

            ],
          ),
        ),
      )
    );
  }
}


String _n2t(int number) {
  if (number<10) {
    return '0' + number.toString();
  } else {
    return number.toString();
  }
}
/*
new Container(
      child: new Row(
        children: <Widget>[
          new Image.network(this._visit.user.photo),
          new Column(
            children: <Widget>[
              new Text(this._visit.user.name),
              new Text(this._visit.user.email)
            ],
          ),
          new Text(this._visit.visitTime.toString())
        ],
      ),
    );
 */
