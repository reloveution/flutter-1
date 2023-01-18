import 'dart:convert';

import '../models/seller_model.dart';
import './base_api_service.dart';
import '../builders/sellers_list_builder.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUri = Uri.parse('http://localhost:3000/seller');

  Future<List<SellerModel>> getSellers() {
    return super.get(sellersDefUri).then((response) {
      final test = SellersListBuilder.build(response);
      return test;
    });
  }

  Future<dynamic> deleteSeller(id) {
    return super.delete(sellersDefUri, id).then((response) {
      return response;
    });
  }

  Future<dynamic> patchSeller(SellerModel sellerModel) {
    Map<String, String> body = sellerModel.toFormatJson();
    return super.patch(sellersDefUri, body).then((response) {
      print('selllerApi: ${response}');
    });
  }
}
