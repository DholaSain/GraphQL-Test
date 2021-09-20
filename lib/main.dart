import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';
import 'package:graphqltest/View/home.dart';

//--//--//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ShopifyApi().getClient();
  var data = (await ShopifyApi().getcollections());
  runApp(MyApp(data));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Model> data;
  MyApp(this.data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(data),
    );
  }
}
