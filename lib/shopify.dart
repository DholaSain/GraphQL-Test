import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';

class Shopify extends StatefulWidget {
  List<Model> pv;
  Shopify(this.pv);

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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.pv.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Container(
                child: Column(
                  children: [
                    // ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     // scrollDirection:Axis.horizontal,
                    //     itemCount: widget.p[index].images!.edges!.length,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         width: 40,
                    //         height: 100,
                    //         child: Image.network(widget.p[index].images!
                    //             .edges![index].node!.originalSrc!),
                    //       );
                    //     }),
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.network(widget.pv[index].products!.edges!
                          .first.node!.images!.edges!.first.node!.originalSrc!),
                    ),
                    Text(
                      widget.pv[index].title.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // Container(
                    //   width: 200,
                    //   child: Text(widget.pv[index].products.),
                    // ),
                  ],
                ),
              ));
            },
          ),
        ),
      ),
    ));
  }
}

  // Container(
  //                     width: 200,
  //                     height: 200,
  //                     child: Image.network(widget
  //                         .p[index].image!.edges!.first.node!.originalSrc!),
  //                   ),