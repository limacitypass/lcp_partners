import 'client.dart';
import 'query.dart';
import 'dart:async';


const String baseApi = "http://api.limacitypass.com/gql";

class Provider {
    static final GQLClient client = new GQLClient(baseApi);    
    static String _token = "";

    set setToken(t) => _token = t;

    static Future<GQLResponse> makeQuery(GQLQuery q) {
        return client.run(q);
    }

    static Future<GQLResponse> makeAuthQuery(GQLQuery q) {
        client.setJwtToken = _token;
        return client.run(q, auth: true);
    }
}