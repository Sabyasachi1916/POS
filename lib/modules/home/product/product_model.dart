// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductList{
  ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

  String productModelToJson(ProductModel data) => json.encode(data.toJson());
}

class ProductModel {
    ProductModel({
        required this.resultDto,
        required this.totalRecord,
    });

    ResultDto resultDto;
    int totalRecord;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        resultDto: ResultDto.fromJson(json["ResultDto"]),
        totalRecord: json["totalRecord"],
    );

    Map<String, dynamic> toJson() => {
        "ResultDto": resultDto.toJson(),
        "totalRecord": totalRecord,
    };
}

class ResultDto {
    ResultDto({
        required this.products,
        required this.productListingDetails,
        this.productListingVariationDetails,
        required this.totalRecord,
    });

    List<Product> products;
    List<ProductListingDetail> productListingDetails;
    dynamic productListingVariationDetails;
    int totalRecord;

    factory ResultDto.fromJson(Map<String, dynamic> json) => ResultDto(
        products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
        productListingDetails: List<ProductListingDetail>.from(json["ProductListingDetails"].map((x) => ProductListingDetail.fromJson(x))),
        productListingVariationDetails: json["ProductListingVariationDetails"],
        totalRecord: json["TotalRecord"],
    );

    Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
        "ProductListingDetails": List<dynamic>.from(productListingDetails.map((x) => x.toJson())),
        "ProductListingVariationDetails": productListingVariationDetails,
        "TotalRecord": totalRecord,
    };
}

class ProductListingDetail {
    ProductListingDetail({
        required this.productId,
        this.productCode,
        required this.categoryId,
        required this.categoryName,
        required this.productDetailsId,
        required this.filterCategoryId,
        required this.filterCategorySortName,
        required this.filterCategoryDetailsId,
        required this.filterCategoryDetailsName,
    });

    int productId;
    dynamic productCode;
    int categoryId;
    String categoryName;
    int productDetailsId;
    int filterCategoryId;
    String filterCategorySortName;
    int filterCategoryDetailsId;
    String filterCategoryDetailsName;

    factory ProductListingDetail.fromJson(Map<String, dynamic> json) => ProductListingDetail(
        productId: json["ProductId"],
        productCode: json["ProductCode"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        productDetailsId: json["ProductDetailsId"],
        filterCategoryId: json["FilterCategoryId"],
        filterCategorySortName: json["FilterCategorySortName"],
        filterCategoryDetailsId: json["FilterCategoryDetailsId"],
        filterCategoryDetailsName: json["FilterCategoryDetailsName"],
    );

    Map<String, dynamic> toJson() => {
        "ProductId": productId,
       // "ProductCode": productCode,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "ProductDetailsId": productDetailsId,
        "FilterCategoryId": filterCategoryId,
        "FilterCategorySortName": filterCategorySortName,
        "FilterCategoryDetailsId": filterCategoryDetailsId,
        "FilterCategoryDetailsName": filterCategoryDetailsName,
    };
}

class Product {
    Product({
        required this.productId,
        required this.storeId,
        required this.categoryId,
        required this.subCategoryId,
        //required this.productCode,
        required this.productName,
        required this.productShortDescription,
        required this.productDescription,
        this.inventoryImagePath,
        this.inventoryImagePathThumb,
        required this.maxQuantityPerOrder,
        required this.isActive,
        required this.isDeleted,
        required this.availableQuantity,
        required this.salePrice,
        this.itemCost,
        this.purchasePrice,
        required this.isTaxable,
        required this.taxPercentage,
        this.productImages,
        this.categoryName,
        this.subCategoryName,
        this.veriationGroupId,
        this.barcode,
        required this.isFeatured,
        required this.modifierResponseDtos,
        this.sku,
        required this.isEbtproduct,
    });

    int productId;
    int storeId;
    int categoryId;
    int subCategoryId;
   // String productCode;
    String productName;
    String productShortDescription;
    String productDescription;
    dynamic inventoryImagePath;
    dynamic inventoryImagePathThumb;
    int maxQuantityPerOrder;
    bool isActive;
    bool isDeleted;
    int availableQuantity;
    double salePrice;
    dynamic itemCost;
    dynamic purchasePrice;
    bool isTaxable;
    int taxPercentage;
    dynamic productImages;
    dynamic categoryName;
    dynamic subCategoryName;
    dynamic veriationGroupId;
    dynamic barcode;
    bool isFeatured;
    List<dynamic> modifierResponseDtos;
    dynamic sku;
    bool isEbtproduct;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["ProductId"],
        storeId: json["StoreId"],
        categoryId: json["CategoryId"],
        subCategoryId: json["SubCategoryId"],
        //productCode: json["ProductCode"] == null ? null : json["ProductCode"],
        productName: json["ProductName"],
        productShortDescription: json["ProductShortDescription"],
        productDescription: json["ProductDescription"],
        inventoryImagePath: json["InventoryImagePath"],
        inventoryImagePathThumb: json["InventoryImagePathThumb"],
        maxQuantityPerOrder: json["MaxQuantityPerOrder"],
        isActive: json["IsActive"],
        isDeleted: json["IsDeleted"],
        availableQuantity: json["AvailableQuantity"],
        salePrice: double.parse(json["SalePrice"].toString()),
        itemCost: json["ItemCost"],
        purchasePrice: json["PurchasePrice"],
        isTaxable: json["IsTaxable"],
        taxPercentage: json["TaxPercentage"],
        productImages: json["ProductImages"],
        categoryName: json["CategoryName"],
        subCategoryName: json["SubCategoryName"],
        veriationGroupId: json["VeriationGroupId"],
        barcode: json["Barcode"],
        isFeatured: json["IsFeatured"],
        modifierResponseDtos: List<dynamic>.from(json["ModifierResponseDtos"].map((x) => x)),
        sku: json["Sku"],
        isEbtproduct: json["IsEbtproduct"],
    );

    Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "StoreId": storeId,
        "CategoryId": categoryId,
        "SubCategoryId": subCategoryId,
       // "ProductCode": productCode == null ? null : productCode,
        "ProductName": productName,
        "ProductShortDescription": productShortDescription,
        "ProductDescription": productDescription,
        "InventoryImagePath": inventoryImagePath,
        "InventoryImagePathThumb": inventoryImagePathThumb,
        "MaxQuantityPerOrder": maxQuantityPerOrder,
        "IsActive": isActive,
        "IsDeleted": isDeleted,
        "AvailableQuantity": availableQuantity,
        "SalePrice": salePrice,
        "ItemCost": itemCost,
        "PurchasePrice": purchasePrice,
        "IsTaxable": isTaxable,
        "TaxPercentage": taxPercentage,
        "ProductImages": productImages,
        "CategoryName": categoryName,
        "SubCategoryName": subCategoryName,
        "VeriationGroupId": veriationGroupId,
        "Barcode": barcode,
        "IsFeatured": isFeatured,
        "ModifierResponseDtos": List<dynamic>.from(modifierResponseDtos.map((x) => x)),
        "Sku": sku,
        "IsEbtproduct": isEbtproduct,
    };
}
