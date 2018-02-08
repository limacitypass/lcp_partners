import 'package:flutter/material.dart';
import 'top.dart';
import 'fields.dart';


class Login extends StatefulWidget {
    @override
    _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                elevation: 0.0,
            ),
            body: new ListView(
                
                children: <Widget>[
                    new LoginAppBar() ,
                    new LoginFields(),

                ],
            )
        );


    }
}
