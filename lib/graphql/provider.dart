import 'client.dart';
import 'query.dart';
import 'dart:async';


const String baseApi = "http://api.limacitypass.com/gql";

class Provider {
    static GQLClient client;   
    static String _token = "";

    static set setToken(t) => _token = t;

    static initProvider({String token}) {
        if (token != null) {
            client = new GQLClient(baseApi, jwtAuthToken: token); 
        } else {
            client = new GQLClient(baseApi);
        }
        
    }

    static Future<GQLResponse> makeQuery(GQLQuery q) async {
        var response = await client.run(q);
        return response;
    }

    static Future<GQLResponse> makeAuthQuery(GQLQuery q) async {
        client.setJwtToken = _token;
        var response = await client.run(q, auth: true);
        return response;
    }
}