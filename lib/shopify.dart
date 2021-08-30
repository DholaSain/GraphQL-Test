import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/Modal/products.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';

class Shopify extends StatefulWidget {
  @override
  _ShopifyState createState() => _ShopifyState();
}

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
final https = HttpLink('https://humera-stagging.myshopify.com');
final authL = AuthLink(
    headerKey: 'X-Shopify-Storefront-Access-Token',
    getToken: () async => '2d87beb704d0a57383d77427cc9017ed');

class _ShopifyState extends State<Shopify> {
  var list = Products();
  @override
  Widget build(BuildContext context) {
    // final HttpLink httpLink = HttpLink(
    //   'https://humera-stagging.myshopify.com',
    //   defaultHeaders: {
    //     "X-Shopify-Storefront-Access-Token": "2d87beb704d0a57383d77427cc9017ed"
    //   },
    // );

    // ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    //     GraphQLClient(
    //         link: authL.concat(https),
    //         cache: GraphQLCache(store: InMemoryStore())));

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shopify'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title ?? 'aaa'),
            Text(Products().title ?? 'aaa'),
          ],
        ),
      ),
    )
        // child: GraphQLProvider(
        //     client: ValueNotifier<GraphQLClient>(GraphQLClient(
        //         link: authL.concat(https),
        //         cache: GraphQLCache(store: InMemoryStore()))),
        //     child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   title: Text('Shopify'),
        // ),
        //       // body: Query(
        //       //   options: QueryOptions(
        //       //     document: gql(getProducs),
        //       //   ),
        //       // ),
        //       // body: Text('AAA ${authL.concat(https).toString()}'),
        //     )),
        );
  }
}
