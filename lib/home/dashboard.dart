import 'package:flutter/material.dart';
import 'package:limacitypasspartners/graphql/provider.dart';
import 'package:limacitypasspartners/auth/storage.dart';
import 'package:limacitypasspartners/graphql/query.dart';
import 'package:limacitypasspartners/graphql/client.dart';


class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => new _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  var _partnerQ;
  var _partnerData;

  
  @override
  initState() async {
    super.initState();
    String token = await CredentialStorage.loadAuthTokenFromCredential();
    Provider.setToken = token;
    
    _partnerQ = await GQLQuery.fromAsset('graphql/partner');
    
    GQLResponse resp = await Provider.makeQuery(_partnerQ);
    assert(!resp.existErrors(), "Problems with query");
    _partnerData = resp.dataIn;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
        ],
      ),
    );
  }
}