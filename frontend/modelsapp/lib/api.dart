import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {

  Future postDataImage(_data) async {
   
    return await http.post(
      Uri.http("104.214.57.104:8000", "/"),
      body: jsonEncode(_data),
    );
  }
}