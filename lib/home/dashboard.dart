import 'package:flutter/material.dart';
import 'package:limacitypasspartners/auth/storage.dart';
import 'package:limacitypasspartners/graphql/graphql.dart';



class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => new _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  GQLQuery _partnerQ;
  var _partnerData;

  
  @override
  initState() {
    super.initState();
    CredentialStorage.loadAuthTokenFromCredential()
    .then((token) {
      Provider.setToken = token;
    });
    
    GQLQuery.fromAsset('graphql/partner.graphql')
    .then((pq){
      _partnerQ = pq
      ..addVar("id", "cjdcxvyhw005o0142smloehty");
    
      Provider.makeAuthQuery(_partnerQ)
      .then((resp) {
        assert(!resp.existErrors(), "Problems with query, ${resp.errors.toString()}");
        _partnerData = resp.data;
        print(resp.data);
        this.setState(()=>null);
      });
    });
    
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Text(this._partnerData.toString())
        ],
      ),
    );
  }
}