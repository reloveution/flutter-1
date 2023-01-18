import '../api/seller_api.dart';
import '../models/seller_model.dart';

class SellersListBuilder {
  static List<SellerModel> build(List response) {
    List<SellerModel> sellersList = [];
    for (int i = 0; i < response.length; i++) {
      sellersList.add(SellerModel.fromJson(response[i]));
    }
    return sellersList;
  }
}
