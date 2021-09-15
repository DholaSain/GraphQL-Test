// import 'package:flutter/material.dart';
// import 'package:graphqltest/Modal/DataModel.dart';

// class ProductView extends StatefulWidget {
//   List<Model> pv;
//   ProductView(this.pv);
//   @override
//   _ProductViewState createState() => _ProductViewState();
// }

// class _ProductViewState extends State<ProductView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back_ios)),
//                 Padding(
//                   padding: const EdgeInsets.all(13.0),
//                   child: Text(
//                     "Products",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.pv.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Center(
//                     child: Column(
//                   children: [
//                    
//                     Text(widget.pv[index].title.toString()),
//                   ],
//                 ));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
