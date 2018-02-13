import 'package:flutter/material.dart';
import 'package:limacitypasspartners/auth/storage.dart';
import 'package:limacitypasspartners/graphql/graphql.dart';
import 'package:limacitypasspartners/home/info_top.dart';
import 'package:limacitypasspartners/types.dart';


class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => new _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  GQLQuery _partnerQ;
  Partner _partnerData;
  InfoTop _infoTop;
  _DashboardState() {
    _infoTop = new InfoTop(
      new Partner("...", "...", "http://via.placeholder.com/350x150", "...", "..."),
    );
  }

  
  @override
  initState() {
    super.initState();
    CredentialStorage.loadAuthTokenFromCredential()
    .then((token) {
      Provider.setToken = token;
      GQLQuery.fromAsset('graphql/partner.graphql')
    .then((pq){
      _partnerQ = pq
      ..addVar("id", "cjdcxvyhw005o0142smloehty");
    
      Provider.makeAuthQuery(_partnerQ)
      .then((resp) {
        assert(!resp.existErrors(), "Problems with query, ${resp.errors.toString()}");
        setState((){
          var id = resp.dataIn["id"];
          var name = resp.dataIn["name"];
          var backgroundImage = resp.dataIn["backgroundImage"];
          var address = resp.dataIn["attraction"]["address"];
          var attractionName = resp.dataIn["attraction"]["name"];

          _partnerData = new Partner(id, name, backgroundImage, address, attractionName);
          _infoTop = new InfoTop(_partnerData);         
        });
      });
    });    
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          _infoTop,
        ],
      ),
    );
  }
}