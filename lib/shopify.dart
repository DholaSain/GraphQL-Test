import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/tempmodel.dart';

class Shopify extends StatefulWidget {
  List<Products> p;
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
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.p.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Container(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.p[index].images!.edges!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 40,
                          height: 100,
                          child: Image.network(widget.p[index].images!
                              .edges![index].node!.originalSrc!),
                        );
                      }),
                  Text(
                    widget.p[index].title.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 200,
                    child: Text(widget.p[index].id.toString()),
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    ));
  }
}
