// import 'package:fibonacci_app/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class FibonacciDetailScreen extends StatefulWidget {
//   @override
//   _FibonacciDetailScreen createState() => _FibonacciDetailScreen();
// }
//
// class _FibonacciDetailScreen extends State<FibonacciDetailScreen> {
//   final fibo_ctl = Get.put(FibonacciController());
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // Future<void> shwBottomSheet(int index,int number) async{
//   //   showModalBottomSheet(
//   //     context: context,
//   //     builder: (context) {
//   //       return  ListView.builder(
//   //         itemCount: fibonacciNumbers.where((val) =>  (val.ipress == true && val.number % 3 == number % 3)).toList().length,
//   //         itemBuilder: (context, index) {
//   //           return ListTile(
//   //             // trailing: Icon(fibo_ctl.icons[index]),
//   //             title: Text("Number: "+fibonacciNumbers[index].number.toString()),
//   //             subtitle:Text("index: "+index.toString()),
//   //             onTap: () {
//   //               // setState(() {
//   //               //   fibo_ctl.fibonacciNumbers.remove(fibo_ctl.fibonacciNumbers[index]);
//   //               //   fibo_ctl.fibonacciNumbers.add(fibo_ctl.fibonacciNumbers[index]);
//   //               // });
//   //               Navigator.pop(context);
//   //               // Scroll to the added item
//   //               Scrollable.ensureVisible(
//   //                 context,
//   //                 alignment: 0.5,
//   //                 duration: Duration(seconds: 1),
//   //               );
//   //             },
//   //           );
//   //         },
//   //       );
//   //     },
//   //   );
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Fibonacci List'),
//         ),
//         body: ListView.builder(
//           itemCount: fibonacciNumbers.where((val) =>  (val.ipress == true && val.number % 3 == number % 3)).toList().length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               // trailing: Icon(fibo_ctl.icons[index]),
//               title: Text("Number: "+fibonacciNumbers[index].number.toString()),
//               subtitle:Text("index: "+index.toString()),
//               onTap: () {
//                 // setState(() {
//                 //   fibo_ctl.fibonacciNumbers.remove(fibo_ctl.fibonacciNumbers[index]);
//                 //   fibo_ctl.fibonacciNumbers.add(fibo_ctl.fibonacciNumbers[index]);
//                 // });
//                 Navigator.pop(context);
//                 // Scroll to the added item
//                 Scrollable.ensureVisible(
//                   context,
//                   alignment: 0.5,
//                   duration: Duration(seconds: 1),
//                 );
//               },
//             );
//           },
//         )
//     );
//   }
//
//
// }
