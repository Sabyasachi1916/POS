import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pos/models/enterPin/UserToken.dart';
import 'package:pos/modules/home/cuisine/cuisine_model.dart';
import 'package:pos/user_details.dart';
class CuisineService{
  Future<List<CuisineListModel>> getCuisines() async {
    final response = await http
      .get(Uri.parse('https://posapi.collegeparkbt.com/api/DiskType/list?onlyhasItem=true&productId=0'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserInfo.shared.info.token}',
    });
     if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log ('${CuisineList().cuisineListModelFromJson(response.body)}');
        var all = CuisineListModel(diskTypeId: 0, name: "All", createdDate: DateTime.now(), createdBy: 1, displayOrder: 'displayOrder', isDeleted: false, selected: true);
        List<CuisineListModel> newList = CuisineList().cuisineListModelFromJson(response.body);
        newList.insert( 0, all);
        return  newList;
      } else {
        throw Exception('Failed to load album');
      }
  }
}