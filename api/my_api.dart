import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAPI {

  Future<List<dynamic>> getData() async{
    var res = await http.get(Uri.parse("https://64da62f5e947d30a260b3301.mockapi.io/faculties"));
    return jsonDecode(res.body);
  }

  Future<void> deleteData(String id) async{
    var res = await http.delete(Uri.parse('https://64da62f5e947d30a260b3301.mockapi.io/faculties/$id'), );
  }

  Future<void> insertData(Map<String,dynamic>? map) async {
    // var jsonMap = jsonEncode(map);
    var res = await http.post(Uri.parse("https://64da62f5e947d30a260b3301.mockapi.io/faculties"),headers: {'Content-Type':'application/json'},body: jsonEncode(map));
  }

  Future<void> updateData(Map<String,dynamic> map,String id) async {
    var res = await http.put(Uri.parse("https://64da62f5e947d30a260b3301.mockapi.io/faculties/$id"),body: map);
  }


}