import 'package:flutter/material.dart';
import 'package:limacitypasspartners/graphql/provider.dart';
import 'package:limacitypasspartners/graphql/query.dart';
import 'package:limacitypasspartners/auth/storage.dart';
import 'package:limacitypasspartners/routes.dart';

class LoginFields extends StatefulWidget {


    @override
    _LoginFieldsState createState() => new _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {

    String _username;
    String _password;
    
    TextFormField _usernamefield;
    TextFormField _passwordfield;

    final _formKey = new GlobalKey<FormState>();

    double _paddingText = 67.0;

   
    @override
    initState() {
        super.initState();

        _usernamefield = new TextFormField(
            onSaved: (value) => _username = value,
            validator: (val) => 
                !val.contains('@') ? 'Not a valid email.' : null,
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
        );
        
        _passwordfield = new TextFormField(
            onSaved: (value)=> _password = value,
            validator: (val) => val==""?'Enter your password':null,
            obscureText: true,
            style: new TextStyle(
                color: Colors.black87,
                fontFamily: "Quicksand",
            ),
            decoration: new InputDecoration(
                labelText: "Password",
                labelStyle: new TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                )
            ),
        );

        
    }
     

    loginPressed(context) async {

        final form = _formKey.currentState;
        if (form.validate()) {
            form.save();
        }else{
            return;
        }

        print("====== Credentials ======");
        print(_username);
        print(_password);

        Routes.navigateTo(context, "/dashboard", replace: true);
        return;
        
        var f = showDialog(
            context: context,
            child: new Container(
                height: 200.0,
                child: new Material(
                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                    child: new Center(child: new Text("Loading...")),
                    
                ),
            )
        );
    
        f.then((_) {
            print('Exit dialog');
        });

        var q = await GQLQuery.fromAsset("graphql/login.graphql")
            ..addVar("email", _username)
            ..addVar("password", _password);
        
        print(q.queryString);

        var resp = await Provider.makeQuery(q);
        if (resp.existErrors()) {
            print(resp.errors);
            Navigator.pop(context);
        } else {
            print(resp.data);
            print(resp.dataIn);
            String token = resp.dataIn["token"];
            
            Provider.setToken = token;
            CredentialStorage.existLocalCredential()
            .then((exist){
                if (!exist) {
                    CredentialStorage.createNewCredential(token);
                }else{
                    CredentialStorage.loadAuthTokenFromCredential()
                    .then((t){
                        print("===============   Exists Credentials   ===============");
                        print(t);
                    });
                    
                }
            });
            Navigator.pop(context);
            
        }

        // Routes.navigateTo(context, "/dashboard", replace: false);

    }


    @override
    Widget build(BuildContext context) {
        return new Container(
            margin: new EdgeInsets.only(top: 30.0),
            child: new Column(

                children: <Widget>[
                    new Form(
                        key: _formKey,
                        child: new Column(
                            children: <Widget>[
                                new Container(
                                    padding: new EdgeInsets.only(left: _paddingText, right: _paddingText),
                                    child: _usernamefield,
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(top: 5.0,left: _paddingText, right: _paddingText),
                                    child: _passwordfield,
                                ),
                            ]
                        ),
                    ),
                    
                    new Container(
                        margin: new EdgeInsets.only(top: 47.0),
                        child: new RaisedButton(
                            highlightColor: new Color(0x00FFFFFF),
                            splashColor: new Color(0x09404040),
                            color: new Color(0xFFFFB431),
                            onPressed: () => this.loginPressed(context),
                            child: new Container(
                                width: 224.0,
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