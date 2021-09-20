import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';

class Shopify extends StatefulWidget {
  List<Model> collection;
  Shopify(this.collection);

  @override
  _ShopifyState createState() => _ShopifyState();
}

class _ShopifyState extends State<Shopify> {
  @override
  Widget build(BuildContext context) {
    // debugPrint('${widget.collection.length.toString()}');
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All products'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.collection.length,
          itemBuilder: (BuildContext context, int index) {
            var allCollections = widget.collection[index].products!.edges;
            var collectionName = widget.collection[index].title;
            // debugPrint(
            //     '${widget.collection[index].products!.edges!.length.toString()}');
            return Center(
                child: Container(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: Text(
                      collectionName!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allCollections!.length,
                      itemBuilder: (context, index) {
                        var allProducts = allCollections[index].node;
                        return Column(
                          children: [
                            Container(
                              height: 40,
                              width: double.infinity,
                              color: Colors.blue,
                            ),
                            GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allProducts!.images!.edges!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  // debugPrint(
                                  //     '${allProducts[index].node!.images!.edges!.length.toString()}');
                                  var allImages = allProducts.images!.edges!;
                                  return Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(allImages[index]
                                        .node!
                                        .originalSrc
                                        .toString()),
                                  );
                                }),
                            Text(allProducts.title.toString()),
                          ],
                        );
                      }),
                  // Container(
                  //   width: 200,
                  //   height: 200,
                  //   child: Image.network(widget
                  //       .pv[index]
                  //       .products!
                  //       .edges![index]
                  //       .node!
                  //       .images!
                  //       .edges![index]
                  //       .node!
                  //       .originalSrc
                  //       .toString()),
                  // ),

                  // Text(
                  //   widget.pv[index].title.toString(),
                  //   style:
                  //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
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
    ));
  }
}

  // Container(
  //                     width: 200,
  //                     height: 200,
  //                     child: Image.network(widget
  //                         .p[index].image!.edges!.first.node!.originalSrc!),
  //                   ),