import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';
import 'package:graphqltest/View/home.dart';

//--//--//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ShopifyApi().getClient();
  var data = (await ShopifyApi().getcollections()) as List<Model>;
  runApp(MyApp(data));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Model> d;
  MyApp(this.d);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(d),
    );
  }
}
