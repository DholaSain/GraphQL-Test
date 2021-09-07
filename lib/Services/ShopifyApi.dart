import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/products.dart';

String? title;
String getProducts = """query {
      shop {
        collections(first: 4) {
          edges {
            node {
              title
              image(maxHeight: 300, maxWidth: 300) {
                transformedSrc
                originalSrc
              }
            }
          }
        }
      }
    }
""";

class ShopifyApi {
  late GraphQLClient client;
  //List<Products> _items=[];
   // ProductsList _i= ProductsList();
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
  @override
  Future<List<Products>> getcollections({lang}) async {
    try {
      print('::::request category');
      client = getClient();
      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(getProducts ),
        // variables: <String, dynamic>{
        //   'nRepositories': nRepositories,
        // },
      );
      final result = await client.query(options);

      if (result.hasException) {
        print(result.exception.toString());
      }

      var list = <Products>[];

      for (var item in result.data!['shop']['collections']['edges']) {
        var category = item['node'];

        list.add(Products.fromJsonShopify(category));
      }

      print(list);
      return list;
    } catch (e) {
      print('::::getCategories shopify error');
      print(e.toString());
      rethrow;
    }
  }

  // Future<ProductsList> getProducts() async {
  //   try {
  //     client = getClient();
  //     final options = QueryOptions(
  //       document: gql(getProducs),
  //       //variables:
  //     );
  //
  //     final result = await client.query(options);
  //
  //     // ? printing Rsult
  //     //print('aaaaaaaaaaa ${result.toString()}');
  //
  //     //! if exception
  //
  //     if (result.hasException) {
  //       print('@@@@@@@@@ : ${result.exception.toString()}');
  //     }
  //     final r =result.data!['products']['edges'];
  //     //final img = result.data!['products']['edges']['node']['images']['edges'];
  //     for (var item in r){
  //       _items.add(Products(producttitle:item['node']['title'],productimage: item['node']['onlineStoreUrl']));
  //       _i.addProduct(_items[j]);
  //       //print(_i.items[j].title);
  //
  //       j++;
  //     }
  //     return _i;
  //
  //   } catch (e) {
  //     print('@@@@ getProducts shopify error');
  //     print(e.toString());
  //     rethrow;
  //   }
  // }
}
