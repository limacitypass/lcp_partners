import 'package:flutter/material.dart';
import 'login/login.dart';
import 'loading/first_screen.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: new FisrtScreen(),
            theme: new ThemeData(
                primaryColor: new Color(0xFF5259F6),
            ),
        );
    }
}
