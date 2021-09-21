import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/DataModel.dart';

String? title;
String getProducts = """
 query {
      shop {
        collections(first: 14) {
          edges {
            node {
              title
              image{
                originalSrc
              }
            	description
             	 products(first: 30){
                edges{
                  node{
                    availableForSale
                    description
                    title
                    vendor
                  totalInventory
                   options{
                    name
                    values
                  }
                    priceRange{
                      maxVariantPrice{
                        amount
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

  Model? item;
  @override
  Future<List<Model>> getcollections({lang}) async {
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
      var list = <Model>[];
      for (var item in result.data!['shop']['collections']['edges']) {
        var category = item['node'];

        list.add(Model.fromJson(category));
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
