import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pos/models/enterPin/UserToken.dart';
class api{
  Future<UserToken> submitPin(String pin) async {
    final response = await http
      .post(Uri.parse('https://posapi.collegeparkbt.com/api/Token/pinlogin?pin=$pin'));
     if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        //log ('${json}');
        return  UserToken.fromJson(json);
      } else {
        throw Exception('Failed to load album');
      }
  }
}
