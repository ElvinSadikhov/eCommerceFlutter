import 'dart:convert'; 
import 'package:e_commerce_app/utils/helpers/purchase.dart';


class PurchaseList {
    PurchaseList({
        required this.purchases,
    });

    final List<Purchase> purchases;

    factory PurchaseList.fromRawJson(String str) => PurchaseList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurchaseList.fromJson(Map<String, dynamic> json) => PurchaseList(
        purchases: List<Purchase>.from(json["purchases"].map((x) => Purchase.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "purchases": List<dynamic>.from(purchases.map((x) => x.toJson())),
    };
}
 