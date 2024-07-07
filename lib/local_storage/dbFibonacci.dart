
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FibonacciListDB extends GetxController  {
  final String sTableName = 'FibonacciList';
  final box = GetStorage('FibonacciList');


  Future<void> initStorage() async {
    await GetStorage.init(sTableName);
  }

  setFibonacciList(String key, dynamic data ) async {
    await box.write(key, data);
  }

  Future<dynamic> getFibonacciList(String key) async {
    dynamic n ;
    if(key!=null){
      if(box.read(key) != null)   n = await  jsonDecode(box.read(key));

    }

    return n;
  }
}