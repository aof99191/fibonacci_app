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
          itemCount: fibo_ctl.finaccimodel.value.fibonacci!.length,
          // itemCount: fibo_ctl.finaccimodel.value.fibonacci!.where((item) =>  item.ipress == false)
          //   .toList().length,

          itemBuilder: (context, index) {
            bool ipress = fibo_ctl.finaccimodel.value.fibonacci![index].ipress!;
            return ListTile(
              onTap: () => onchanges(index,fibo_ctl.finaccimodel.value.fibonacci![index].number!),
              title: Text("Index: ${fibo_ctl.finaccimodel.value.fibonacci![index].id.toString()}, Number: ${fibo_ctl.finaccimodel.value.fibonacci![index].number.toString()}"),
              trailing: Icon(fibo_ctl.icons[fibo_ctl.finaccimodel.value.fibonacci![index].type!]),
            );
          },
        ))
    );
  }
  Widget test(int index){
    return ListTile(
      onTap: () => onchanges(index,fibo_ctl.finaccimodel.value.fibonacci![index].number!),
      title: Text("Index: ${fibo_ctl.finaccimodel.value.fibonacci![index].id.toString()}, Number: ${fibo_ctl.finaccimodel.value.fibonacci![index].number.toString()}"),
      trailing: Icon(fibo_ctl.icons[fibo_ctl.finaccimodel.value.fibonacci![index].type!]),
    );
  }
  void onchanges(int index,int number) async{
    // if( await connectdb.getFibonacciList("FibonacciList") != null){
    //   finaccimodel.value = await connectdb.getFibonacciList("FibonacciList");
    // }

    setState(() {
      fibo_ctl.finaccimodel.value.fibonacci![index].ipress = true ;
      // fibo_ctl.finaccimodel.value.fibonacci!.removeAt(index);
      // fibo_ctl.finaccimodel.value.fibonacci!.add(fibo_ctl.finaccimodel.value.fibonacci![index]);
      fibo_ctl.finaccimodel.value.toJson();
    });

     await shwBottomSheet(index,number);

  }

  Future<void> shwBottomSheet(int idex , int number) async{
    List<dynamic> filteredItems = fibo_ctl.finaccimodel.value.fibonacci!
        .where((item) => item.number! % 3 == number % 3 && item.ipress == true)
        .toList();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return  ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              // trailing: Icon(fibo_ctl.icons[index]),
              trailing: Icon( fibo_ctl.icons[filteredItems[index].type]),
              title: Text("Number: "+filteredItems[index].number.toString()),
              subtitle:Text("index: "+filteredItems[index].id.toString()),
              onTap: () {
                setState(() {
                  fibo_ctl.finaccimodel.value.fibonacci![idex].ipress = false ;
                  // fibo_ctl.finaccimodel.value.fibonacci!.removeAt(index);
                  // fibo_ctl.finaccimodel.value.fibonacci!.add(filteredItems[index]);
                  fibo_ctl.finaccimodel.value.toJson();
                });
                Navigator.pop(context,true);
                // Scroll to the added item
                Scrollable.ensureVisible(
                  context,
                  alignment: 0.5,
                  duration: Duration(seconds: 1),
                );
              },
            );
          },
        );
      },
    );
  }
}
