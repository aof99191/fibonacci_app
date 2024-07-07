
import 'package:fibonacci_app/local_storage/dbFibonacci.dart';
import 'package:fibonacci_app/view/FibonacciListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  create_dbstorage();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
void create_dbstorage() async {
  await Get.put(FibonacciListDB()).initStorage();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FibonacciListScreen(),
    );
  }
}
