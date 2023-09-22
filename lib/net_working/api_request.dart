import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/User.dart';
import 'apis.dart';

class ApiServices {

  static List<User> parseData(String ResponeBody){
    var lst = json.decode(ResponeBody) as List<dynamic>;
    var users = lst.map((e) => User.fromJson(e)).toList();
    return users;
  }

  static Future<User> fetchDetail(int userId) async {
    final response = await http.get(Uri.parse('${ApiUrls().GetAll}/$userId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception('Lỗi khi tải thông tin người dùng');
    }
  }

}