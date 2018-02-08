import 'client.dart';
import 'query.dart';
import 'dart:async';


const String baseApi = "http://api.limacitypass.com/gql";

class Provider {
    static GQLClient client;   
    static String _token = "";

    set setToken(t) => _token = t;

    static initProvider({String token}) {
        if (token != null) {
            client = new GQLClient(baseApi, jwtAuthToken: token); 
        } else {
            client = new GQLClient(baseApi);
        }
        
    }

    static Future<GQLResponse> makeQuery(GQLQuery q) {
        return client.run(q);
    }

    static Future<GQLResponse> makeAuthQuery(GQLQuery q) {
        client.setJwtToken = _token;
        return client.run(q, auth: true);
    }
}