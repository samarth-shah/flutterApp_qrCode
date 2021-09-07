import 'dart:convert';
import 'package:http/http.dart' as http;

String url = 'https://jsonplaceholder.typicode.com/users';

class DataReceiver {
  var decodedData;
  String _name = '';

  Future<String> getData() async {
    String userName = '';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      userName = decodedData[0]['name'];
    }
    _name = userName;
    return userName;
  }

  Future<String> passName() async {
    //todo: send arg to getData and return name
    await getData();
    return _name;
  }
}
