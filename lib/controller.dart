import 'dart:convert';
import 'package:fibonacci_app/local_storage/dbFibonacci.dart';
import 'package:fibonacci_app/model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class FibonacciController extends GetxController {
  // final fibonacciNumbers = Rx<List<int>>([]);
  // final fibonacciNumbers = RxList<String>([]);
  // final fibonacciNumbers = <FibonacciNumber>[].obs;

  final connectdb = Get.put(FibonacciListDB());
  var finaccimodel = FibonacciNumber().obs;

  final List<IconData> icons = [
    Icons.circle,
    Icons.square,
    Icons.add,
  ];

  void onchanges(int index) async{
    if( await connectdb.getFibonacciList("FibonacciList") != null){
      finaccimodel.value = await connectdb.getFibonacciList("FibonacciList");
    }
  }


  void generateFibonacciNumbers(int count){
    List<dynamic> gendata = [];
    Map<String,dynamic> map = {};
    for (int i = 0; i < count; i++) {
      Map<String,dynamic> m = {};
      m['id'] = i;
      m['number'] = fibonacci(i);
      m['type'] = fibonacci(i) % 3;
      m['ipress'] = false;
      gendata.add(m);
    }
    map['fibonacci'] = gendata;
    // print(jsonEncode(map));
    connectdb.setFibonacciList("FibonacciList",jsonEncode(map));

    finaccimodel.value = FibonacciNumber.fromJson(map);
  }


  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    } else {
      return fibonacci(n - 1) + fibonacci(n - 2);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    generateFibonacciNumbers(41);
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

// void onchanges(int index,int i) async{
//   setState(() {
//     fibonacciNumbers.removeAt(index);
//
//     fibonacciNumbers.insert(
//         i,
//         fibonacciNumber(
//             id:i,
//             number: fibonacci(i),
//             type: icons[fibonacci(i) % 3],
//             ipress:true
//         ));
//
//     shwBottomSheet(i,fibonacci(i));
//   });
//
//
//
//
// }
// print(fibonacci(i));
// fibonacciNumbers.add(
//   fibonacciNumber(
//       id:i,
//       number: fibonacci(i),
//       type: icons[fibonacci(i) % 3],
//       ipress:false
//   ),
// );