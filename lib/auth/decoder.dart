import 'dart:convert';

Map<String, Object> getPayloadFromJWTToken(String token) {
    var chunks = token.split(".");

    var payload = chunks[1];
    payload = BASE64.normalize(payload);

    var codeUnits = BASE64.decode(payload);
    var rawData = UTF8.decode(codeUnits);

    return JSON.decode(rawData);

}