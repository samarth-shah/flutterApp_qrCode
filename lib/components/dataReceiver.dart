import 'dart:convert';
import 'package:http/http.dart' as http;

String url = 'https://jsonplaceholder.typicode.com/users';

class DataReceiver {
  var decodedData;
  String _name = '';
  var _number = '';
  var _uCode = '';

//todo: make a map to store details
  Future<String> getData() async {
    String userName = '';
    var num = '';
    var ucode = '';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      userName = decodedData[1]['name'];
      num = decodedData[1]['address']['zipcode'];
      ucode = decodedData[1]['phone'];
    }
    _name = userName;
    _number = num;
    _uCode = ucode;
    //print(_uCode);
    return userName;
  }

  Future<String> passName() async {
    //todo: send arg to getData and return name
    await getData();
    return _name;
  }

  Future<String> passNumber() async {
    //todo: send arg to getData and return name
    await getData();
    return _number;
  }
}
