import 'package:flutter/material.dart';
import 'package:graphqltest/Modal/DataModel.dart';
import 'package:graphqltest/Services/ShopifyApi.dart';
import 'package:graphqltest/View/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ShopifyApi().getClient();
  var data = (await ShopifyApi().getcollections()) as List<Model>;
  // Timer(Duration(seconds: 1), );
  runApp(MyApp(data));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Model> d;
  MyApp(this.d);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(d),
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
