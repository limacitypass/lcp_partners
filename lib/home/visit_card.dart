import 'package:flutter/material.dart';
import '../types.dart';


class VisitCard extends StatelessWidget {
  
  User _user;
  DateTime _visitTime;
  VisitCard(this._user);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Image.network(this._user.photo),
          new Column(
            children: <Widget>[
              new Text(this._user.name),
              new Text(this._user.email)
            ],
          ),
          new Text(_visitTime.toString())
        ],
      ),
    );
  }

}