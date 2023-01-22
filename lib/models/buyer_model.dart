import 'dart:convert';

class BuyerModel {
  String? id;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? phone;
  String? email;

  BuyerModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.dob,
      this.phone,
      this.email});

  BuyerModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      DateTime? dob,
      String? phone,
      String? email}) {
    return BuyerModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        phone: phone ?? this.phone,
        email: email ?? this.email);
  }

  BuyerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = DateTime.parse(json['dob']);
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id ?? '';
    data['firstName'] = this.firstName ?? '';
    data['lastName'] = this.lastName ?? '';
    data['dob'] = this.dob.toString();
    data['phone'] = this.phone ?? '';
    data['email'] = this.email ?? '';
    return data;
  }

  Map<String, String> toFormatJson() {
    final Map<String, String> data = Map<String, String>();
    data['id'] = id ?? '';
    data['firstName'] = firstName ?? '';
    data['lastName'] = lastName ?? '';
    data['dob'] = dob.toString();
    data['phone'] = phone ?? '';
    data['email'] = email ?? '';
    return data;
  }
}
