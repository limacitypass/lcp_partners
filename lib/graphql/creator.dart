import 'dart:io';

class GQLQuery {
  File queryFile;
  String queryString;
  Map<String, dynamic> vars;

  GQLQuery.file(String path, {Map<String, dynamic> vars}) {
    this.queryFile = new File(path);
    this.queryString = this.queryFile.readAsStringSync();
    if (vars != null) {
      this.vars = vars;
    }else{
      vars = new Map<String, dynamic>();
    }
  }

  GQLQuery.query(String q, {Map<String, dynamic> vars}) {
    this.queryString = q;
    if (vars != null) {
      this.vars = vars;
    }else{
      vars = new Map<String, dynamic>();
    }
  }
  set changeQuery(String query) => this.queryString = query;
  
  addVar(String name, dynamic value) {
    this.vars.addAll({name: value});
  }
  

}