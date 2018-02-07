import 'package:flutter/material.dart';
import 'package:fullscreen_mode/fullscreen_mode.dart';


class FisrtScreen extends StatelessWidget {

  FisrtScreen() {
    FullscreenMode.setFullscreen();
  }
  
  @override
  Widget build(BuildContext context) {
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