import 'package:graphql_flutter/graphql_flutter.dart';

String? title;
<<<<<<< Updated upstream
String getProducs = """{
  products(first: 5){
=======
String getProducts = """
   query {
  collections(first:3){
>>>>>>> Stashed changes
    edges{
      node{
        description
        title
        image{
          transformedSrc
        }
        products(first:5){
          edges{
            node{
              id
              images(first:3){
                edges{
                  node{
                    originalSrc
                    transformedSrc
                  }
                }
              }
            }
          }
        }
        }
    }
  }
}



""";

class ShopifyApi {
  late GraphQLClient client;
<<<<<<< Updated upstream

=======
  //List<Products> _items=[];
  // ProductsList _i= ProductsList();
  int j = 0;
>>>>>>> Stashed changes
  GraphQLClient getClient() {
    final https = HttpLink(
        'https://ewiglife-ecomapp.myshopify.com/api/2021-07/graphql.json');
    final authL = AuthLink(
        headerKey: 'X-Shopify-Storefront-Access-Token',
        getToken: () => '	86338fd3004e0c485ca61f68dd2c59e7');

    var _client =
        GraphQLClient(link: authL.concat(https), cache: GraphQLCache());
    return _client;
  }

<<<<<<< Updated upstream
  Future<List>? getProducts() async {
=======
  @override
  Future<List<Collections>> getcollections({lang}) async {
>>>>>>> Stashed changes
    try {
      print('::::request category');
      client = getClient();
      const nRepositories = 50;
      final options = QueryOptions(
<<<<<<< Updated upstream
        document: gql(getProducs),
        // variables:
=======
        document: gql(getProducts),
        // variables: <String, dynamic>{
        //   'nRepositories': nRepositories,
        // },
>>>>>>> Stashed changes
      );
      final result = await client.query(options);

<<<<<<< Updated upstream
      // ? printing Rsult
      print('aaaaaaaaaaa ${result.toString()}');

      //! if exception

=======
>>>>>>> Stashed changes
      if (result.hasException) {
        print(result.exception.toString());
      }

<<<<<<< Updated upstream
      var list = [];

      for (var item in result.data!['products']['edges']) {
        list.add(item['node']['title']);
      }
=======
      var list = <Collections>[];

      for (var item in result.data!['collections']['edges']) {
        var category = item['node'];

        list.add(Collections.fromJsonShopify(category));
      }

>>>>>>> Stashed changes
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
