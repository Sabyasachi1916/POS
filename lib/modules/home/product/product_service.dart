import 'dart:ffi';

import 'package:pos/modules/home/product/product_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pos/user_details.dart';


class ProductService{
  Future<ProductModel> getProductList({required String id, required String dishTypeID} ) async {
    var headers = {
                    'Authorization': 'Bearer ${UserInfo.shared.info.token}',
                    'Content-Type': 'application/json'
                  };
    var url =  Uri.parse('https://posapi.collegeparkbt.com/api/Product/ProductListingDetails');
    
     var body = json.encode({
                                "CategoryId": int.parse(id) ,
                                "DiskTypeId": int.parse(dishTypeID)
                              });
   

   final response = await http.post(url, headers: headers, body: body);

     if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log ('${ProductList().productModelFromJson(response.body)}');
        ProductModel productModel = ProductList().productModelFromJson(response.body);
        return  productModel;
      } else {
        throw Exception('Failed to load album');
      }
  }
}