import '../models/seller_model.dart';
import './base_api_service.dart';
import '../builders/sellers_list_builder.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUrl = Uri.parse('http://localhost:3000/seller');

  // getsellers() {
  //   return super.get(sellersDefUrl).then((response) => response);
  // }

  Future<List<SellerModel>> getSellers() {
    return super.get(sellersDefUrl).then((response) {
      final test = SellersListBuilder.build(response);
      return test;
    });
  }
}
