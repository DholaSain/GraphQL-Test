import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/products.dart';

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

// abstract class BaseServices {
//   Future<List<Products>>? getProducts() => null;
// }

class ShopifyApi {
  // static final ShopifyApi _instance = ShopifyApi._internal();

  // factory ShopifyApi() => _instance;

  // ShopifyApi._internal();

  late GraphQLClient client;

  GraphQLClient getClient() {
    final https = HttpLink('https://humera-stagging.myshopify.com');
    final authL = AuthLink(
        headerKey: 'X-Shopify-Storefront-Access-Token',
        getToken: () => '2d87beb704d0a57383d77427cc9017ed');
    return GraphQLClient(link: authL.concat(https), cache: GraphQLCache());
  }

  Future<List<Products>>? getProducts() async {
    try {
      client = getClient();
      final options = QueryOptions(
        document: gql(getProducs),
        // variables:
      );
      final result = await client.query(options);
      print('aaaaaaaaaaa ${result.toString()}');
      if (result.hasException) {
        print(result.exception.toString());
      }
      title = result.data!['products']['edges']['node']['title'];

      var list = <Products>[];

      for (var item in result.data!['products']['edges']) {
        list.add(item['node']);
      }
      print(list);
      return list;
    } catch (e) {
      print('::::getProducts shopify error');
      print(e.toString());
      rethrow;
    }
  }
}
