import '../api/sellerApi.dart';
import '../models/sellerModel.dart';

class SellersListBuilder {
  // build() {
  //   SellerApi sellerApi = new SellerApi();
  //   List<SellerModel>? sellersList = [];
  //   // print('---from SellersListBuilder');
  //   sellerApi.getsellers().then((response) => {
  //         // print('sellerListBuilder 1${sellersList}')
  //         for (int i = 0; i < response.length; i++)
  //           {
  //             sellersList.add(new SellerModel.fromJson(response[i])),
  //             // print('sellerListBuilder 1${sellersList}')
  //             print(sellersList[i].sellerInfo!.email)
  //           }
  //       });
  //   return sellersList;
  // }
  static build(List response) {
    List<SellerModel>? sellersList = [];
    for (int i = 0; i < response.length; i++) {
      sellersList.add(new SellerModel.fromJson(response[i]));
      // print('sellerListBuilder 1${sellersList}')
      print(sellersList[i].sellerInfo!.email);
    }

    return sellersList;
  }
}

// class SellerModelBuilder {
//   build() {}
// }

// print('--E--${sellersList[0].sellerId}'),
// print('--E--${sellersList[0].sellerInfo!.firstName}')