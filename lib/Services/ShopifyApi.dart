import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/products.dart';

String? title;
String getProducs = """{
  products(first: 2){
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
  List<Products> _items=[];
   ProductsList _i= ProductsList();
  int j=0;
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

  Future<ProductsList> getProducts() async {
    try {
      client = getClient();
      final options = QueryOptions(
        document: gql(getProducs),
        //variables:
      );

      final result = await client.query(options);

      // ? printing Rsult
      //print('aaaaaaaaaaa ${result.toString()}');

      //! if exception

      if (result.hasException) {
        print('@@@@@@@@@ : ${result.exception.toString()}');
      }
      final r =result.data!['products']['edges'];
      //final img = result.data!['products']['edges']['node']['images']['edges'];
      for (var item in r){
        _items.add(Products(producttitle:item['node']['title'],productimage: item['node']['onlineStoreUrl']));
        _i.addProduct(_items[j]);
        //print(_i.items[j].title);

        j++;
      }
      return _i;

    } catch (e) {
      print('@@@@ getProducts shopify error');
      print(e.toString());
      rethrow;
    }
  }
}
