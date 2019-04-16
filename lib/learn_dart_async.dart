import 'dart:async';
import 'package:http/http.dart' as http;

main() {
  getNetData().then((str) {
    print(str);
  });
}

Future<String> getNetData() async {
  http.Response response = await http.get("http://www.baidu.com");
  return response.body;
}