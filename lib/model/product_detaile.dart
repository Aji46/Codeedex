// To parse this JSON data, do
//
//     final productDetaile = productDetaileFromJson(jsonString);

import 'dart:convert';

ProductDetaile productDetaileFromJson(String str) => ProductDetaile.fromJson(json.decode(str));

String productDetaileToJson(ProductDetaile data) => json.encode(data.toJson());

class ProductDetaile {
    int id;
    int partsCat;
    String partImage;
    int vBrand;
    int vCategory;
    String price;
    String partsName;
    String description;
    dynamic offerPrice;
    bool isOffer;
    String productRating;

    ProductDetaile({
        required this.id,
        required this.partsCat,
        required this.partImage,
        required this.vBrand,
        required this.vCategory,
        required this.price,
        required this.partsName,
        required this.description,
        required this.offerPrice,
        required this.isOffer,
        required this.productRating,
    });

    factory ProductDetaile.fromJson(Map<String, dynamic> json) => ProductDetaile(
        id: json["id"],
        partsCat: json["parts_Cat"],
        partImage: json["part_image"],
        vBrand: json["v_brand"],
        vCategory: json["v_category"],
        price: json["price"],
        partsName: json["parts_name"],
        description: json["description"],
        offerPrice: json["offer_price"],
        isOffer: json["is_offer"],
        productRating: json["product_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parts_Cat": partsCat,
        "part_image": partImage,
        "v_brand": vBrand,
        "v_category": vCategory,
        "price": price,
        "parts_name": partsName,
        "description": description,
        "offer_price": offerPrice,
        "is_offer": isOffer,
        "product_rating": productRating,
    };
}
