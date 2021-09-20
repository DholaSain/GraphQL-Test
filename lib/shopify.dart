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
        title: Text('All products'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.pv.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Container(
                child: Column(
                  children: [
                    // Text(widget.pv[index].title.toString()),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.pv[index].products!.edges!.length,
                        itemBuilder: (context, index) {
                          var allProducts = widget.pv[index].products!.edges!;
                          return Column(
                            children: [
                              GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: allProducts[index]
                                      .node!
                                      .images!
                                      .edges!
                                      .length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var allImages =
                                        allProducts[index].node!.images!.edges!;
                                    return Container(
                                      height: 200,
                                      width: 200,
                                      child: Image.network(allImages[index]
                                          .node!
                                          .originalSrc
                                          .toString()),
                                    );
                                  }),
                              // ListView.builder(
                              //   physics: NeverScrollableScrollPhysics(),
                              //   shrinkWrap: true,
                              //   itemCount: allProducts[index]
                              //       .node!
                              //       .images!
                              //       .edges!
                              //       .length,
                              //   itemBuilder: (context, int index) {
                              //     var allImages =
                              //         allProducts[index].node!.images!.edges!;
                              //     return Container(
                              //       height: 200,
                              //       width: 200,
                              //       child: Image.network(allImages[index]
                              //           .node!
                              //           .originalSrc
                              //           .toString()),
                              //     );
                              //     // return ListView.builder(
                              //     //     physics: NeverScrollableScrollPhysics(),
                              //     //     shrinkWrap: true,
                              //     //     itemCount: allImages[index].node.originalSrc.,
                              //     //     itemBuilder: (context, int index) {
                              //     //       return Container(
                              //     //         width: 40,
                              //     //         height: 100,
                              //     //         child: Image.network(widget
                              //     //             .pv[index]
                              //     //             .products!
                              //     //             .edges![index]
                              //     //             .node!
                              //     //             .images!
                              //     //             .edges!
                              //     //             .first
                              //     //             .node!
                              //     //             .originalSrc!
                              //     //             .toString()),
                              //     //       );
                              //     //     });
                              //   },
                              // ),
                              Text(widget
                                  .pv[index].products!.edges![index].node!.title
                                  .toString()),
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