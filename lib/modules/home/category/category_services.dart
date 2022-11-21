import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pos/modules/home/category/category_model.dart';

class CategoryService{
  Future<List<CategoryModel>> getCategorylist() async {
    final response = await http
      .get(Uri.parse('https://posapi.collegeparkbt.com/api/categories/getcategorymenu'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
     if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log ('${CategoryList().categoryModelFromJson(response.body)}');
        List<CategoryModel> newList = CategoryList().categoryModelFromJson(response.body);
        return  newList;
      } else {
        throw Exception('Failed to load album');
      }
  }
  Future<List<CategoryModel>> getNewCategoies( {required String cuisineType}) async {
    final response = await http
      .get(Uri.parse('https://posapi.collegeparkbt.com/api/categories/getcategorymenu?DiskTypeId=${cuisineType}'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
     if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log ('${CategoryList().categoryModelFromJson(response.body)}');
        List<CategoryModel> newList = CategoryList().categoryModelFromJson(response.body);
        return  newList;
      } else {
        throw Exception('Failed to load album');
      }
  }



  
}