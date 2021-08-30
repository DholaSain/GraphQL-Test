// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class Home extends StatefulWidget {
//   final String? userName;
//   Home({this.userName});
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String personalToken = '2d87beb704d0a57383d77427cc9017ed';

//   @override
//   Widget build(BuildContext context) {
//     final HttpLink httpLink =
//         HttpLink('https://humera-stagging.myshopify.com', defaultHeaders: {
//       "X-Shopify-Storefront-Access-Token": "2d87beb704d0a57383d77427cc9017ed"
//     });

//     ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
//         GraphQLClient(
//             link: httpLink, cache: GraphQLCache(store: InMemoryStore())));

//     return SafeArea(
//       child: GraphQLProvider(
//         client: client,
//         child: MyHomePage(
//           userName: widget.userName,
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String? userName;
//   const MyHomePage({Key? key, this.userName}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     //Please note that Dart uses a notation with three quotes to make the queries.

//     String readRepositories = """
//     query Flutter_Github_GraphQL{
//             user(login: "EwigLife") {
//                 avatarUrl(size: 200)
//                 location
//                 name
//                 url
//                 email
//                 login
//                 repositories {
//                   totalCount
//                 }
//                 followers {
//                   totalCount
//                 }
//                 following {
//                   totalCount
//                 }
//               }
//       viewer {
//               starredRepositories(last: 12) {
//                 edges {
//                   node {
//                     id
//                     name
//                     nameWithOwner
//                   }
//                 }
//               }
//             }
//           }
//       """;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Github with GraphQL'),
//         backgroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       body: Query(
//         options: QueryOptions(
//           document: gql(readRepositories),
//         ),
//         builder: (QueryResult result,
//             {VoidCallback? refetch, FetchMore? fetchMore}) {
//           if (result.exception != null) {
//             return Center(
//               child: Text(result.exception.toString()),
//             );
//           }
//           if (result.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final userDetails = result.data!['user'];
//           List starredRepos =
//               result.data!['viewer']['starredRepositories']['edges'];

//           return Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     color: Colors.black,
//                     alignment: Alignment.center,
//                     child: Column(
//                       children: [
//                         SizedBox(height: 2),
//                         ClipOval(
//                           child: Image.network(
//                             userDetails["avatarUrl"],
//                             filterQuality: FilterQuality.high,
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           userDetails['name'],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           userDetails['login'],
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.location_on,
//                               color: Colors.grey,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               userDetails['location'],
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.link,
//                               color: Colors.grey,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               userDetails['url'],
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.email,
//                               color: Colors.grey,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               userDetails['email'],
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Column(
//                                 children: <Widget>[
//                                   Text(
//                                     userDetails["repositories"]['totalCount']
//                                         .toString(),
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "Repositories",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                                   )
//                                 ],
//                               ),
//                               Column(
//                                 children: <Widget>[
//                                   Text(
//                                     userDetails["followers"]['totalCount']
//                                         .toString(),
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "Followers",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                                   )
//                                 ],
//                               ),
//                               Column(
//                                 children: <Widget>[
//                                   Text(
//                                     userDetails["following"]['totalCount']
//                                         .toString(),
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "Following",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 10.0, bottom: 2, left: 10),
//                     child: Text(
//                       "Starred Repositories",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Divider(),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 330.0),
//                 child: ListView.builder(
//                   itemCount: starredRepos.length,
//                   itemBuilder: (context, index) {
//                     final repository = starredRepos[index];
//                     return Padding(
//                       padding:
//                           const EdgeInsets.only(left: 10.0, top: 8, bottom: 8),
//                       child: Card(
//                         elevation: 0,
//                         child: Row(
//                           children: <Widget>[
//                             Icon(Icons.collections_bookmark),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 repository['node']['nameWithOwner'],
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
