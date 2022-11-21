// To parse this JSON data, do
//
//     final cuisineListModel = cuisineListModelFromJson(jsonString);

import 'dart:convert';
class CuisineList{
    List<CuisineListModel> cuisineListModelFromJson(String str) => List<CuisineListModel>.from(json.decode(str).map((x) => CuisineListModel.fromJson(x)));

    String cuisineListModelToJson(List<CuisineListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}


class CuisineListModel {
    CuisineListModel({
        required this.diskTypeId,
        required this.name,
        required this.createdDate,
        required this.createdBy,
        required this.displayOrder,
        required this.isDeleted,
        this.deletedBy,
        this.deletedOn,
        required this.selected,
    });

    int diskTypeId;
    String name;
    DateTime createdDate;
    int createdBy;
    dynamic displayOrder;
    bool isDeleted;
    dynamic deletedBy;
    dynamic deletedOn;
    bool selected;

    factory CuisineListModel.fromJson(Map<String, dynamic> json) => CuisineListModel(
        diskTypeId: json["DiskTypeId"],
        name: json["Name"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        displayOrder: json["DisplayOrder"],
        isDeleted: json["IsDeleted"],
        deletedBy: json["DeletedBy"],
        deletedOn: json["DeletedOn"],
        selected: json["Selected"],
    );

    Map<String, dynamic> toJson() => {
        "DiskTypeId": diskTypeId,
        "Name": name,
        "CreatedDate": createdDate.toIso8601String(),
        "CreatedBy": createdBy,
        "DisplayOrder": displayOrder,
        "IsDeleted": isDeleted,
        "DeletedBy": deletedBy,
        "DeletedOn": deletedOn,
        "Selected": selected,
    };
}
