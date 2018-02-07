import 'package:http/http.dart' as http;
import 'endpoints.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


Future<int> validateUser(String email, password, File file) async {
    http.Response response = await http.post(
        loginEndpoint,
        headers: {"Content-Type": "aplication/json"},
        body: '{"email": "$email", "password": "$password" }',
    );

    if (response.statusCode != 200) {
        return response.statusCode;
    }

    JsonDecoder decoder = new JsonDecoder();
    Map<String, String> data = decoder.convert(response.body);
    print(data["token"]);

    await file.writeAsString(data["token"]);
    return 200;
}