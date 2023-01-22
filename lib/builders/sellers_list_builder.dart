import '../models/seller_model.dart';

class SellersListBuilder {
  static List<SellerModel> build(List? response) {
    List data = response ?? [];
    List<SellerModel> sellersList = [];
    for (int i = 0; i < data.length; i++) {
      sellersList.add(SellerModel.fromJson(data[i]));
    }
    return sellersList;
  }
}
