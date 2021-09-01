import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/products.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';

class Shopify extends StatefulWidget {
  @override
  _ShopifyState createState() => _ShopifyState();
}

class _ShopifyState extends State<Shopify> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Shopify'),
        ),
        body: Center(
          child: FutureBuilder(
            future: ShopifyApi().getProducts(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(child: Text(snapshot.data![index]));
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
