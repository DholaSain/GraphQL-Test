import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/tempmodel.dart';

String? title;
String getProducts = """
  {
  products(first: 30) {
    edges {
      node {
        id
        title
        updatedAt
        collections(first:2){
          edges{
            node{
              title
            }
          }
        }
        images(first:5){
          edges{
            node{
              originalSrc
            }
          }
        }
      }
    }
  }
}
""";

//--//==//--//
class ShopifyApi {
  late GraphQLClient client;
  //List<Products> _items=[];
  // ProductsList _i= ProductsList();
  int j = 0;
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

  Products? item;
  @override
  Future<List<Products>> getcollections({lang}) async {
    try {
      print('::::request category');
      client = getClient();
      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(getProducts),
        // variables: <String, dynamic>{
        //   'nRepositories': nRepositories,
        // },
      );
      final result = await client.query(options);
      if (result.hasException) {
        print(result.exception.toString());
      }
      print(result);
      var list = <Products>[];
      for (var item in result.data!['products']['edges']) {
        var category = item['node'];

        list.add(Products.fromJson(category));
      }

      print(list);
      return list;
    } catch (e) {
      print('::::getCategories shopify error');
      print(e.toString());
      rethrow;
    }
  }
}
