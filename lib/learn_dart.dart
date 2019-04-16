main() {
//  var a = 1;
//  int b = 10;
//  String s = "hello";
//  dynamic c = 0.5;
//
//  var count = 10;
//  final Num = count;
//  const Num1 = 10;

  // numbers
  var a = 0;
  int b = 1;
  double c = 0.1;

  // strings
  var s1 = 'hello';
  String s2 = 'world';

  // booleans
  var real = true;
  bool isReal = false;

  // lists
  var arr = [1, 2, 3, 4, 5];
  List<String> arr2 = ['hello', 'world', 'abc', 'xyz'];
  List<dynamic> arr3 = [1, true, 'haha', 1.0];

  // maps
  var map = new Map();
  map['name'] = 'Chen';
  map['age'] = 25;
  Map m = new Map();
  m['a'] = 'a';

  // runes
  var clapping = '\u{1f44f}';
  print(clapping);

  // symbols
  print(#s == new Symbol("s"));

  print(add(1, 2));
  print(add2(3, 4));
  print(add3(5, 6));

  sayHello(name: "Chen");
  sayHello();
  sayHello2(name: "Cheng");
  sayHello2();

  sayHello4("Chen", 25);
  sayHello4("Chen", 28, "play basketball");

  var arrInt = [1, 2, 3];
  arrInt.forEach(printNum);

  var f1 = printNum;
  Function f2 = printNum;
  var f3 = (int a) => print("a = $a");
  f1(1);
  f2(2);
  f3(3);
  
  test((param) {
    print(param);
  });
}

test(Function callback) {
  callback("hello");
}

printNum(int a) {
  print("$a");
}

sayHello4(String name, int age, [String hobby]) {
  StringBuffer sb = new StringBuffer();
  sb.write("Hello, this is $name and I am $age years old");
  if (hobby != null) {
    sb.write(", my hobby is $hobby.");
  }
  print(sb.toString());
}

sayHello({String name}) {
  print("Hello, my name is $name");
}

sayHello2({name: String}) {
  print("Hello2, my name is $name");
}

int sum(int a, int b, [int c = 3]) {
  return a + b + c;
}

int add4({int a, int b = 3}) {
  return a + b;
}

int add(int a, int b) {
  return a + b;
}

add2(int a, int b) {
  return a + b;
}

add3(a, b) => a + b;