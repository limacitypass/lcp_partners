import 'package:flutter/material.dart';
import '../routes.dart';
import 'dart:async';
import 'package:fluro/fluro.dart';


class FirstScreen extends StatelessWidget {

  delay(context) async {
    return new Future.delayed(const Duration(milliseconds: 2000), () {
      Routes.navigateTo(context, "/login", replace: true, transition: TransitionType.fadeIn);
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