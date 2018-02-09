import 'package:flutter/material.dart';
import 'package:limacitypasspartners/login/login.dart';
import 'package:limacitypasspartners/graphql/provider.dart';
import 'package:limacitypasspartners/home/dashboard.dart';
import 'package:limacitypasspartners/loading/first_screen.dart';

void main() { 
    Provider.initProvider();
    runApp(new App()); 
}

class App extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: new FirstScreen(),
            theme: new ThemeData(
                primaryColor: new Color(0xFF5259F6),
                accentColor: new Color(0xFF5259F6),
            ),
            routes: <String, WidgetBuilder>{
                '/login': (BuildContext context) => new Login(),
                '/dashboard' : (BuildContext context) => new Dashboard()
            },
        );
    }
}
