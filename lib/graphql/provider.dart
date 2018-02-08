import 'client.dart';

const String baseApi = "http://api.limacitypass.com/gql";

class Provider {
    static final GQLClient client = new GQLClient(baseApi);
}