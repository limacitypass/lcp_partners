import 'package:flutter/material.dart';
import 'package:limacitypasspartners/types.dart';

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = new RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.2,
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
      stops: [0.4, 1.0],
    );
    canvas.drawRect(
      rect,
      new Paint()..shader = gradient.createShader(rect),
    );
  }

  
  
  bool shouldRepaint(Sky oldDelegate) => false;
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

class InfoTop extends StatelessWidget {

    Partner _partnerInfo;

    InfoTop(this._partnerInfo);

    
    @override
    Widget build(BuildContext context) {
        

        return new Container(
            child: new CustomPaint(
                painter: new Sky(),
                child: new Center(
                    child: new Text(
                        _partnerInfo.name,
                        style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFFFFFFFF),
                        ),
                    ),
                ),
            ),
        );
        
    }
}