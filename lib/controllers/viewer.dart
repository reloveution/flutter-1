import '../builders/sellersListBuilder.dart';

class Viewer {
  viewSellers() {
    SellersListBuilder sellersListBuilder = new SellersListBuilder();
    print(sellersListBuilder.build());
  }
}
