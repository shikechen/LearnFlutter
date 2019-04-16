main() {
  // if else语句
  int score = 80;
  if (score < 60) {
    print("so bad!");
  } else if (score >= 60 && score < 80) {
    print("just so so!");
  } else if (score >= 80) {
    print("good job!");
  }

  // switch语句
  String a = "hello";
  // case语句中的数据类型必须是跟switch中的类型一致
  switch (a) {
    case "hello":
      print("haha");
      break;
    case "world":
      print("heihei");
      break;
    default:
      print("WTF");
  }

  // for语句
  List<String> list = ["a", "b", "c"];
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  for (var i in list) {
    print(i);
  }
  // 这里的箭头函数参数必须用圆括号扩起来
  list.forEach((item) => print(item));

  // while语句
  int start = 1;
  int sum = 0;
  while (start <= 100) {
    sum += start;
    start++;
  }
  print(sum);

  // try catch语句
  try {
    print(1 ~/ 0);
  } catch (e) {
    // IntegerDivisionByZeroException
    print(e);
  }
  try {
    1 ~/ 0;
  } on IntegerDivisionByZeroException {
    // 捕获指定类型的异常
    print("error"); // 打印出error
  } finally {
    print("over"); // 打印出over
  }
}
