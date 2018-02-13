import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;


class PainterTop extends CustomPainter {

    String imageUrl;
    
    PainterTop(this.imageUrl);

    @override
    void paint(Canvas canvas, Size size) {
        var rect = Offset.zero & size;
        var path = new Path();

        var _width = size.bottomRight(Offset.zero).dx;
        
        var _height =  size.bottomRight(Offset.zero).dy;

        path.addPolygon(<Offset>[
            new Offset(0.0, 0.0),
            new Offset(_width, 0.0),
            new Offset(_width, _height-40.0),
            new Offset(0.0, _height)
        ], true);

        Paint _paint = new Paint();
        _paint.color = Colors.redAccent;
        
        
        print("========== IMAGE URL ==========");
        print(imageUrl);

        http.get(imageUrl)
        .then((resp) {
            if (resp.statusCode == 200) {
                var list = resp.bodyBytes;
                ui.decodeImageFromList(list, (i) {
                    print(i.toString());
                    canvas.drawImage(i, new Offset(100.0, 100.0), _paint);
                    
                });
            }
            
        });
        // canvas.drawPath(path, _paint);
    }

  
  
  bool shouldRepaint(PainterTop oldDelegate) => false;
  bool shouldRebuildSemantics(PainterTop oldDelegate) => false;
}