import 'package:flutter/material.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';
import 'package:graphqltest/shopify.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ShopifyApi().getClient();
  ShopifyApi().getProducts();
  // Timer(Duration(seconds: 1), );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shopify(),
    );
  }
}

// class Input extends StatelessWidget {
//   const Input({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController username = TextEditingController();

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: username,
//             ),
//             SizedBox(height: 15),
//             MaterialButton(
//               color: Colors.black,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => Home(
//                       userName: username.text,
//                     ),
//                   ),
//                 );
//               },
//               child: Text(
//                 'Get UserData',
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
