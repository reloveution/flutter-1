import '../api/sellerApi.dart';
import '../models/sellerModel.dart';

class SellersListBuilder {
  build() {
    SellerApi sellerApi = new SellerApi();
    List sellersList = sellerApi.getsellers();
  }

  // build() {
  //     let sellerArray = []
  //     for (let i = 0; i < (this.jsonData.length); i++) {
  //         sellerArray[i] = new SellerBuilder(this.jsonData[i]).build()
  //     }
  //     return sellerArray;
  // }

}

class SellerModelBuilder {
  build() {}
}

class SellerInfoBuilder {
  // SellerInfoBuilder(List sellerInfo) {
  //   this.firstName = sellerInfo.firstName;
  // }
}
