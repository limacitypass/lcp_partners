import 'package:flutter/material.dart';
import 'package:limacitypasspartners/types.dart';

class LcpClip extends CustomClipper<Path> {
    
    @override
    Path getClip(Size size) {
        var path = new Path();
        var _width = size.bottomRight(Offset.zero).dx;
        var _height =  size.bottomRight(Offset.zero).dy;

        path.addPolygon(<Offset>[
            new Offset(0.0, 0.0),
            new Offset(_width, 0.0),
            new Offset(_width, _height-40.0),
            new Offset(0.0, _height)
        ], true);

        return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class InfoTop extends StatelessWidget {

    Partner _partnerInfo;

    InfoTop(this._partnerInfo);

    
    @override
    Widget build(BuildContext context) {
        ImageProvider _backgroundImage = new NetworkImage(_partnerInfo.backgroundImage);
        
        double _w = MediaQuery.of(context).size.bottomRight(Offset.zero).dy;

        return new ClipPath(
            clipper: new LcpClip(),
            child: new Material(
                color: new Color(0xFF3D2B3D),
                elevation: 3.0,
                child: new Container(
                    height: 260.0,
                    width: _w,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: _backgroundImage,
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
                ),
            ),
        );         
    }
}