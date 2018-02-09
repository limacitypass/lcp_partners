import 'package:flutter/material.dart';
import 'dart:async';


class FirstScreen extends StatelessWidget {

  delay(context) async {
    return new Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed("/login");
      // FullscreenMode.setNormal();      
    });
  }

  FirstScreen() {
    // FullscreenMode.setFullscreen();
  }
  
  @override
  Widget build(BuildContext context) {
    delay(context);
    return new Container(
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fitHeight,
            image: new AssetImage('assets/images/background.png'),
          ),
        ),
        child: new Center(
          child: new Image.asset('assets/images/lcp_logo.png', height: 180.0,),
        ),
      ),
    );
  }
}