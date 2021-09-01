import 'package:graphql_flutter/graphql_flutter.dart';

String? title;
String getProducs = """{
  products(first: 5){
    edges{
      node{
        title
        onlineStoreUrl
      }
    }
  }
}
""";

class ShopifyApi {
  late GraphQLClient client;

  GraphQLClient getClient() {
    final https = HttpLink(
        'https://humera-stagging.myshopify.com/api/2021-07/graphql.json');
    final authL = AuthLink(
        headerKey: 'X-Shopify-Storefront-Access-Token',
        getToken: () => '2d87beb704d0a57383d77427cc9017ed');

    var _client =
        GraphQLClient(link: authL.concat(https), cache: GraphQLCache());
    return _client;
  }

  Future<List>? getProducts() async {
    try {
      client = getClient();
      final options = QueryOptions(
        document: gql(getProducs),
        // variables:
      );

      final result = await client.query(options);

      // ? printing Rsult
      print('aaaaaaaaaaa ${result.toString()}');

      //! if exception

      if (result.hasException) {
        print('@@@@@@@@@ : ${result.exception.toString()}');
      }

      var list = [];

      for (var item in result.data!['products']['edges']) {
        list.add(item['node']['title']);
      }
      print(list);
      return list;
    } catch (e) {
      print('@@@@ getProducts shopify error');
      print(e.toString());
      rethrow;
    }
  }
}
