import 'dart:convert';

Map<String, Object> getPayloadFromJWTToken(String token) {
    var chunks = token.split(".");
    
    var payload = chunks[1];
    
    payload = base64.normalize(payload);
    var codeUnits = base64.decode(payload);
    var rawData = utf8.decode(codeUnits);

    return json.decode(rawData);

}