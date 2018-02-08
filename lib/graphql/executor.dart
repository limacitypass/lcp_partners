import 'package:http/http.dart' as http;


class GQLClient {
  String uri;
  String jwtToken;

  GQLClient(String uri, {String jwtAuthToken}) {
    this.uri = uri;
    if (jwtAuthToken != null) {
      this.jwtToken = jwtAuthToken;
    }
  }

  


}