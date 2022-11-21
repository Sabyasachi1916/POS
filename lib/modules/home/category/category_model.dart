// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';
class CategoryList{
  List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

  String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

}

class CategoryModel {
    CategoryModel({
        required this.name,
        required this.id,
        //required this.imageLink,
        //required this.siteSubMenu,
    });

    String name;
    String id;
    //String imageLink;
    //List<CategoryModel>? siteSubMenu;

    // ignore: unnecessary_question_mark
    factory CategoryModel.fromJson(Map<String, dynamic?> json) => CategoryModel(
        name: json["name"],
        id: json["id"],
        //imageLink: json["imageLink"] == null ? null : json["imageLink"],
       // siteSubMenu:  json["SiteSubMenu"] == null ? null : List<CategoryModel>.from(json["SiteSubMenu"].map((x) => CategoryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        //"imageLink": imageLink == null ? null : imageLink,
        //"SiteSubMenu": siteSubMenu == null ? null : List<dynamic>.from(siteSubMenu?.map((x) => x.toJson())),
    };
}
