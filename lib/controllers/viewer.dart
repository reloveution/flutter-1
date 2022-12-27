import '../api/sellerApi.dart';
import '../builders/sellersListBuilder.dart';

class Viewer {
  sellers() {
    String jsonData = sellerApi.getsellers().then((result) => {result});
    Map sellersList = {};
    for (int i = 0; i < (jsonData.length); i++) {
      sellersList[i] = new SellerModelBuilder(this.jsonData[i]).build();
    }

    return sellersList;

    Map sellersListBuilder = new SellersListBuilder().build();
    print(sellersListBuilder);
  }
}
