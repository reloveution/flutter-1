import '../models/buyer_model.dart';

class BuyersListBuilder {
  static List<BuyerModel> build(List? response) {
    List data = response ?? [];
    List<BuyerModel> buyersList = [];
    for (int i = 0; i < data.length; i++) {
      buyersList.add(BuyerModel.fromJson(data[i]));
    }
    return buyersList;
  }
}
