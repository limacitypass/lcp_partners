import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

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

  GQLQuery.asset(String name, {Map<String, dynamic> vars}) {
    this._keyAsset = name;
    rootBundle.loadString(this._keyAsset)
    .then((data) { // PLEASE, YOU NEED FOCUS THAT
      data = data.replaceAll("\n", "");
      this.queryString = data;
    });
    if (vars != null) {
      this.vars = vars;
    }else{
      this.vars = new Map<String, dynamic>();
    }
  }


  // getFile() async {
  //   String data = await rootBundle.loadString(this._keyAsset);
  //   data = data.replaceAll("\n", "");
  //   this.queryString = data;
  // }

  GQLQuery.query(String q, {Map<String, dynamic> vars}) {
    this.queryString = q;
    if (vars != null) {
      this.vars = vars;
    }else{
      this.vars = new Map<String, dynamic>();
    }
  }
  set changeQuery(String query) => this.queryString = query;
  
  addVar(String name, dynamic value) {
    this.vars.addAll({name: value});
  }
  

}