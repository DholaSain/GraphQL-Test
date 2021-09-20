import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';

class CollectionProduct extends StatefulWidget {
  Model p;
  CollectionProduct(this.p);

  @override
  State<CollectionProduct> createState() => _CollectionProductState();
}

class _CollectionProductState extends State<CollectionProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Center(
                child: Container(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.p.products!.edges!.length,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            child: Text(
                                widget.p.products!.edges![index].node!.title!),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.p.products!.edges![index].node!
                                .images!.edges!.length,
                            itemBuilder: (constext, index) {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.p.products!.edges![index]
                                      .node!.images!.edges!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(widget
                                          .p
                                          .products!
                                          .edges![index]
                                          .node!
                                          .images!
                                          .edges![index]
                                          .node!
                                          .originalSrc!),
                                    );
                                  });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ))));
  }
}



//
  // ListView.builder(
  //                           physics: NeverScrollableScrollPhysics(),
  //                           shrinkWrap: true,
  //                           itemCount: widget.p.products!.edges![index].node!
  //                               .images!.edges!.length,
  //                           itemBuilder: (constext, index) {
  //                             return ListView.builder(
  //                                 physics: NeverScrollableScrollPhysics(),
  //                                 shrinkWrap: true,
  //                                 itemCount: widget
  //                                     .p
  //                                     .products!
  //                                     .edges![index]
  //                                     .node!
  //                                     .images!
  //                                     .edges!
  //                                     .first
  //                                     .node!
  //                                     .originalSrc!
  //                                     .length,
  //                                 itemBuilder: (context, index) {
  //                                   return Image.network(widget
  //                                       .p
  //                                       .products!
  //                                       .edges![index]
  //                                       .node!
  //                                       .images!
  //                                       .edges![index]
  //                                       .node!
  //                                       .originalSrc!);
  //                                 });
  //                           },
  //                         ),