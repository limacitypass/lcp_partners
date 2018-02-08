import 'package:flutter/material.dart';
import '../routes.dart';
import 'dart:async';

class LoginFields extends StatefulWidget {


    @override
    _LoginFieldsState createState() => new _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {

    TextEditingController _username = new TextEditingController();
    TextEditingController _password = new TextEditingController();

    double _paddingText = 67.0;

    // Future<File> _getLocalTokenFile() async {
    //     // get the path to the document directory.
    //     String dir = (await getApplicationDocumentsDirectory()).path;
    //     print(dir);
    //     return new File('$dir/token.lcp');
    // }

    loginPressed(context) async {
        // String username = _username.text;
        // String password = _password.text;

        // Routes.navigateTo(context, "/dashboard", replace: false);

    }


    @override
    Widget build(BuildContext context) {
        return new Container(
            margin: new EdgeInsets.only(top: 70.0),
            child: new Column(

                children: <Widget>[
                    new Container(
                        child: new TextField(
                            controller: _username,
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                                color: Colors.black87,
                                fontFamily: "Quicksand",
                            ),
                            decoration: new InputDecoration(
                                labelText: "Email/username",
                                labelStyle: new TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                )
                            ),
                        ),
                        padding: new EdgeInsets.only(left: _paddingText, right: _paddingText),
                    ),

                    new Container(
                        child: new TextField(
                            controller: _password,
                            obscureText: true,
                            style: new TextStyle(
                                color: Colors.black87,
                                fontFamily: "Quicksand",
                            ),
                            decoration: new InputDecoration(
                                labelText: "Password",
                                labelStyle: new TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.0,
                                )
                            ),
                        ),
                        padding: new EdgeInsets.only(top: 5.0,left: _paddingText, right: _paddingText),
                    ),

                    new Container(
                        margin: new EdgeInsets.only(top: 47.0),
                        child: new RaisedButton(
                            highlightColor: new Color(0x00FFFFFF),
                            splashColor: new Color(0x09404040),
                            color: new Color(0xFFFFB431),
                            onPressed: () => this.loginPressed(context),
                            child: new Container(
                                width: 137.0,
                                child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        new Text("LOGIN",
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Quicksand',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500
                                            )
                                        )
                                    ],
                                )
                            ),
                        ),
                    )

                ],
            ),
        );
    }
}