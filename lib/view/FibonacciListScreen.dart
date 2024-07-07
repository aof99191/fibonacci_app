import 'package:fibonacci_app/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FibonacciListScreen extends StatefulWidget {
  @override
  _FibonacciListScreenState createState() => _FibonacciListScreenState();
}

class _FibonacciListScreenState extends State<FibonacciListScreen> {
  final fibo_ctl = Get.put(FibonacciController());

  @override
  void initState() {

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fibonacci List'),
        ),
        body: Obx(() => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: fibo_ctl.finaccimodel.value.fibonacci!.where((val) =>  (val.ipress == false )).toList().length,
          // itemCount: fibo_ctl.finaccimodel.value.fibonacci!.length,
          itemBuilder: (context, index) {
            // int data = fibo_ctl.finaccimodel.value.fibonacci![index].id!;
            return ListTile(
              onTap: () => fibo_ctl.onchanges(fibo_ctl.finaccimodel.value.fibonacci![index].id!),
              title: Text("Index: ${fibo_ctl.finaccimodel.value.fibonacci![index].id.toString()}, Number: ${fibo_ctl.finaccimodel.value.fibonacci![index].number.toString()}"),
              trailing: Icon(fibo_ctl.icons[fibo_ctl.finaccimodel.value.fibonacci![index].type!]),
            );
          },
        ))
    );
  }


}
