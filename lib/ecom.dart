// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class ECom extends StatefulWidget {
//   @override
//   _EComState createState() => _EComState();
// }

// class _EComState extends State<ECom> {
//   @override
//   Widget build(BuildContext context) {
//     String readCollections = """{
//   products(first: 5){
//     edges{
//       node{
//         title
//         onlineStoreUrl
//       }
//     }
//   }
// }
// """;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text('Shopify'),
//         ),
//         body: Query(
//             options: QueryOptions(
//                 document: gql(readCollections), variables: {'cursor': 'UTF-8'}),
//             builder: (QueryResult result,
//                 {VoidCallback? refetch, FetchMore? fetchMore}) {
//               if (result.exception != null) {
//                 return Center(
//                   child: Text(result.exception.toString()),
//                 );
//               }
//               if (result.isLoading) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               final shopp = result.data!['shop'];
//               List shopData = result.data!['products']['edges'];
//               return Center(
//                 child: Text("shopData[1]['node']['title']"),
//                 // child: ListView.builder(
//                 //     itemCount: shopData.length,
//                 //     itemBuilder: (context, index) {
//                 //       final collection = shopData[index];
//                 //       return Container(
//                 //         padding: EdgeInsets.all(10),
//                 //         child: Text(collection['node']['title']),
//                 //       );
//                 //     }),
//               );
//             }),
//         // body: Text('aaaaaa'),
//       ),
//     );
//   }
// }
