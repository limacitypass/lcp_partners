import 'package:flutter/material.dart';
import 'loading/first_screen.dart';
import 'routes.dart';


void main() { 
    Routes.initRoutes();
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
            ),
        );
    }
}
