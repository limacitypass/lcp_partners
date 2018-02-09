import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class GQLQuery {
  File queryFile;
  String queryString;
  Map<String, dynamic> vars;
  String _keyAsset;

  GQLQuery.file(String path, {Map<String, dynamic> vars}) {
    this.queryFile = new File(path);
    this.queryString = this.queryFile.readAsStringSync();
    if (vars != null) {
      this.vars = vars;
    }else{
      this.vars = new Map<String, dynamic>();
    }
  }

  GQLQuery.query(String q, {Map<String, dynamic> vars}) {
    this.queryString = q;
    if (vars != null) {
      this.vars = vars;
    }else{
      this.vars = new Map<String, dynamic>();
    }
  }

  static Future<GQLQuery> fromAsset(String name, {Map<String, dynamic> vars}) async {
    var data = await rootBundle.loadString(name);
    data = data.replaceAll("\n", "");
    String q = data;
    GQLQuery query = new GQLQuery.query(q, vars: vars);
    return query;
  }


  // getFile() async {
  //   String data = await rootBundle.loadString(this._keyAsset);
  //   data = data.replaceAll("\n", "");
  //   this.queryString = data;
  // }

  
  set changeQuery(String query) => this.queryString = query;
  
  addVar(String name, dynamic value) {
    this.vars.addAll({name: value});
  }
  

}