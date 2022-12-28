import '../api/sellerApi.dart';
import '../models/sellerModel.dart';

class SellersListBuilder {
  build() {
    SellerApi sellerApi = new SellerApi();
    List<SellerModel> sellersList = [];
    // final sellersList = <List<SellerModel>>[];
    print('---from SellersListBuilder');
    sellerApi
        .getsellers()
        .then((response) => {
              for (int i = 0; i < response.length; i++)
                {sellersList.add(new SellerModel.fromJson(response[i]))},
              // {sellersList = new SellerModel.fromJson(response[i]),
              // print('--E--${sellersList}'),
            })
        .then((result) => {});
    print('--W--${sellersList}');
    return sellersList;
    // Map sellersListBuilder = new SellersListBuilder().build();

    // SellerApi sellerApi = new SellerApi();
    // SellerModel sellerModel = new SellerModel();
    // sellerApi.getsellers().then((result) => print('+++${result}'));
  }
}

// class SellerModelBuilder {
//   build() {}
// }