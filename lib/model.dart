// To parse this JSON data, do
//
//     final fibonacciNumber = fibonacciNumberFromJson(jsonString);

import 'dart:convert';

FibonacciNumber fibonacciNumberFromJson(String str) => FibonacciNumber.fromJson(json.decode(str));

String fibonacciNumberToJson(FibonacciNumber data) => json.encode(data.toJson());

class FibonacciNumber {
  final List<Fibonacci>? fibonacci;

  FibonacciNumber({
    this.fibonacci,
  });

  factory FibonacciNumber.fromJson(Map<String, dynamic> json) => FibonacciNumber(
    fibonacci: json["fibonacci"] == null ? [] : List<Fibonacci>.from(json["fibonacci"]!.map((x) => Fibonacci.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fibonacci": fibonacci == null ? [] : List<dynamic>.from(fibonacci!.map((x) => x.toJson())),
  };
}

class Fibonacci {
  int? id;
  int? number;
  int? type;
  bool? ipress;

  Fibonacci({
    this.id,
    this.number,
    this.type,
    this.ipress,
  });

  factory Fibonacci.fromJson(Map<String, dynamic> json) => Fibonacci(
    id: json["id"],
    number: json["number"],
    type: json["type"],
    ipress: json["ipress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "type": type,
    "ipress": ipress,
  };
}
