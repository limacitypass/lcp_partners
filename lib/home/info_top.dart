import 'package:flutter/material.dart';
import 'package:limacitypasspartners/types.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

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

class InfoTop extends StatelessWidget {

    Partner _partnerInfo;

    InfoTop(this._partnerInfo);

    
    @override
    Widget build(BuildContext context) {
        
        

        return new Container(
            height: 260.0,
            width: MediaQuery.of(context).size.bottomRight(Offset.zero).dy,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(_partnerInfo.backgroundImage),
                    fit: BoxFit.fitHeight,
                    colorFilter: new ColorFilter.mode(Colors.black54, BlendMode.darken)
                ),
            ),
            child: new Container(
                child: new Column(
                    children: <Widget>[
                        new Padding(
                            padding: new EdgeInsets.only(top: 150.0),
                        ),
                        new Text(
                            _partnerInfo.name,
                            style: new TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                fontSize: 24.0,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                        ),
                        new Text(
                            _partnerInfo.address,
                            style: new TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                        ),
                    ],
                ),
            )
        );
        
    }
}