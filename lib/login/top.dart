import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
    final double barHeight = 336.0;


    @override
    Widget build(BuildContext context) {

        return new Container(

            child: new Column(
                children: <Widget>[
                    new Container(
                        child: new Image.asset("assets/images/top_login.png"),
                    ),
                ],
            )
        );
    }
}

