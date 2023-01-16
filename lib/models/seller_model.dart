import 'dart:convert';

class SellerModel {
  SellerInfo? sellerInfo;
  String? id;
  String? sellerId;

  SellerModel({this.sellerInfo, this.id, this.sellerId});

  SellerModel.fromJson(Map<String, dynamic> json) {
    sellerInfo = json['sellerInfo'] != null
        ? SellerInfo.fromJson(json['sellerInfo'])
        : null;
    id = json['id'];
    sellerId = json['sellerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.sellerInfo != null) {
      data['sellerInfo'] = this.sellerInfo!.toJson();
    }
    data['id'] = this.id;
    data['sellerId'] = this.sellerId;
    return data;
  }

  Map<String, String> toFormatJson() {
    final Map<String, String> data = Map<String, String>();
    data['id'] = this.id ?? '';
    data['firstName'] = this.sellerInfo?.firstName ?? '';
    data['lastName'] = this.sellerInfo?.lastName ?? '';
    data['email'] = this.sellerInfo?.email ?? '';
    return data;
  }
}

class SellerInfo {
  String? firstName;
  String? lastName;
  String? email;

  SellerInfo({this.firstName, this.lastName, this.email});

  SellerInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = Map<String, String>();
    data['firstName'] = this.firstName ?? '';
    data['lastName'] = this.lastName ?? '';
    data['email'] = this.email ?? '';
    return data;
  }
}
