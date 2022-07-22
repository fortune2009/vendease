// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  dynamic total;
  dynamic limit;
  dynamic skip;
  List<Datum> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    total: json["total"] == null ? null : json["total"],
    limit: json["limit"] == null ? null : json["limit"],
    skip: json["skip"] == null ? null : json["skip"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "limit": limit == null ? null : limit,
    "skip": skip == null ? null : skip,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.image,
    this.bulkPrice,
    this.vendorBulkPrice,
    this.vendeaseBulkPrice,
    this.vendorPrice,
    this.vendeasePrice,
    this.marketPrice,
    this.discountDeleted,
    this.deleted,
    this.name,
    this.categoryId,
    this.subCategoryId,
    this.description,
    this.discount,
    this.weight,
    this.weightUnit,
    this.countryCode,
    this.cityCode,
    this.ownerType,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.categoryDetails,
  });

  String id;
  String image;
  List<dynamic> bulkPrice;
  List<dynamic> vendorBulkPrice;
  List<dynamic> vendeaseBulkPrice;
  dynamic vendorPrice;
  dynamic vendeasePrice;
  dynamic marketPrice;
  bool discountDeleted;
  bool deleted;
  String name;
  String categoryId;
  String subCategoryId;
  String description;
  Discount discount;
  String weight;
  String weightUnit;
  String countryCode;
  String cityCode;
  String ownerType;
  String owner;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic v;
  CategoryDetails categoryDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    image: json["image"] == null ? null : json["image"],
    bulkPrice: json["bulk_price"] == null ? null : List<dynamic>.from(json["bulk_price"].map((x) => x)),
    vendorBulkPrice: json["vendor_bulk_price"] == null ? null : List<dynamic>.from(json["vendor_bulk_price"].map((x) => x)),
    vendeaseBulkPrice: json["vendease_bulk_price"] == null ? null : List<dynamic>.from(json["vendease_bulk_price"].map((x) => x)),
    vendorPrice: json["vendor_price"] == null ? null : json["vendor_price"],
    vendeasePrice: json["vendease_price"] == null ? null : json["vendease_price"],
    marketPrice: json["market_price"] == null ? null : json["market_price"],
    discountDeleted: json["discount_deleted"] == null ? null : json["discount_deleted"],
    deleted: json["deleted"] == null ? null : json["deleted"],
    name: json["name"] == null ? null : json["name"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    subCategoryId: json["sub_category_id"] == null ? null : json["sub_category_id"],
    description: json["description"] == null ? null : json["description"],
    discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    weight: json["weight"] == null ? null : json["weight"],
    weightUnit: json["weight_unit"] == null ? null : json["weight_unit"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    cityCode: json["cityCode"] == null ? null : json["cityCode"],
    ownerType: json["owner_type"] == null ? null : json["owner_type"],
    owner: json["owner"] == null ? null : json["owner"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    categoryDetails: json["category_details"] == null ? null : CategoryDetails.fromJson(json["category_details"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "image": image == null ? null : image,
    "bulk_price": bulkPrice == null ? null : List<dynamic>.from(bulkPrice.map((x) => x)),
    "vendor_bulk_price": vendorBulkPrice == null ? null : List<dynamic>.from(vendorBulkPrice.map((x) => x)),
    "vendease_bulk_price": vendeaseBulkPrice == null ? null : List<dynamic>.from(vendeaseBulkPrice.map((x) => x)),
    "vendor_price": vendorPrice == null ? null : vendorPrice,
    "vendease_price": vendeasePrice == null ? null : vendeasePrice,
    "market_price": marketPrice == null ? null : marketPrice,
    "discount_deleted": discountDeleted == null ? null : discountDeleted,
    "deleted": deleted == null ? null : deleted,
    "name": name == null ? null : name,
    "category_id": categoryId == null ? null : categoryId,
    "sub_category_id": subCategoryId == null ? null : subCategoryId,
    "description": description == null ? null : description,
    "discount": discount == null ? null : discount.toJson(),
    "weight": weight == null ? null : weight,
    "weight_unit": weightUnit == null ? null : weightUnit,
    "countryCode": countryCode == null ? null : countryCode,
    "cityCode": cityCode == null ? null : cityCode,
    "owner_type": ownerType == null ? null : ownerType,
    "owner": owner == null ? null : owner,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
    "category_details": categoryDetails == null ? null : categoryDetails.toJson(),
  };
}

class CategoryDetails {
  CategoryDetails({
    this.name,
    this.taxExempt,
    this.discount,
    this.subCategory,
  });

  String name;
  bool taxExempt;
  Discount discount;
  String subCategory;

  factory CategoryDetails.fromJson(Map<String, dynamic> json) => CategoryDetails(
    name: json["name"] == null ? null : json["name"],
    taxExempt: json["tax_exempt"] == null ? null : json["tax_exempt"],
    discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    subCategory: json["sub_category"] == null ? null : json["sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "tax_exempt": taxExempt == null ? null : taxExempt,
    "discount": discount == null ? null : discount.toJson(),
    "sub_category": subCategory == null ? null : subCategory,
  };
}

class Discount {
  Discount({
    this.discountType,
    this.discountValue,
    this.id,
  });

  String discountType;
  dynamic discountValue;
  String id;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    discountType: json["discount_type"] == null ? null : json["discount_type"],
    discountValue: json["discount_value"] == null ? null : json["discount_value"],
    id: json["_id"] == null ? null : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "discount_type": discountType == null ? null : discountType,
    "discount_value": discountValue == null ? null : discountValue,
    "_id": id == null ? null : id,
  };
}
