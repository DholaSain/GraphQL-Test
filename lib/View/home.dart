import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';
import 'package:graphqltest/shopify.dart';

class ProductView extends StatefulWidget {
  List<Model> p;
  ProductView(this.p);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext contexst) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Collection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Shopify(widget.p)),
                    );
                  },
                  child: Text("All product"),
                ),
              ],
            ),
            GridView.builder(
              itemCount: widget.p.length,
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 300,
                  width: 300,
                  child: Card(
                    child: GridTile(
                      child: Image.network(widget.p[index].image!.originalSrc!),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
