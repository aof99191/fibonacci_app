import 'package:flutter/material.dart';

class FibonacciListScreen extends StatefulWidget {
  @override
  _FibonacciListScreenState createState() => _FibonacciListScreenState();
}

class _FibonacciListScreenState extends State<FibonacciListScreen> {
  List<int> fibonacciNumbers = [];
  List<IconData> icons = [
    Icons.circle,
    Icons.square,
    Icons.add,
  ];

  @override
  void initState() {
    super.initState();
    generateFibonacciNumbers(41);
  }

  void generateFibonacciNumbers(int count) {
    int a = 0, b = 1;
    fibonacciNumbers.add(a);
    fibonacciNumbers.add(b);
    for (int i = 2; i < count; i++) {
      int next = a + b;
      fibonacciNumbers.add(next);
      a = b;
      b = next;
    }
  }

  void showBottomSheet(BuildContext context, int number) {
    List<int> filteredItems = fibonacciNumbers
        .where((item) => item % 3 == number % 3)
        .toList();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              // leading: Icon(icons[index]),
              title: Text(filteredItems[index].toString()),
              onTap: () async{
                // setState((){
                //   fibonacciNumbers.removeAt(index);
                //   fibonacciNumbers.add(filteredItems[index]);
                // });
                // Navigator.pop(context);
                // // Scroll to the added item
                // Future.delayed(Duration(milliseconds: 300), () {
                //   Scrollable.ensureVisible(
                //     context,
                //     alignment: 0.5,
                //     duration: Duration(seconds: 1),
                //   );
                // });
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci List'),
      ),
      body:   SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: fibonacciNumbers.map((number) {
            return GestureDetector(
              onTap: () => showBottomSheet(context, number),
              child: ListTile(
                leading: Icon(icons[number % 3]),
                title: Text(number.toString()),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


