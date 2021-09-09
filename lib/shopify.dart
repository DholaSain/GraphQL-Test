import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/products.dart';
import 'package:graphqltest/View/product.dart';

class Shopify extends StatefulWidget {
  List<Collections> p;
  Shopify(this.p);

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
        title: Text('Shopifyy'),
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.p.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Column(
              children: [
                //Container(height: 100,width: 100,color: Colors.purpleAccent,),

                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductView(widget.p)),
                    );
                  },
                  child: Image.network(
                    widget.p[index].image.toString(),
                    height: 200,
                    width: 200,
                  ),
                ),
                Text(widget.p[index].name.toString()),
              ],
            ));
          },
        ),
      ),
    ));
  }
}
