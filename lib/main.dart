import 'package:flutter/material.dart';
import 'loading/first_screen.dart';
import 'routes.dart';
import 'package:limacitypasspartners/graphql/provider.dart';


void main() { 
    Routes.initRoutes();
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
        );
    }
}
