import '../builders/sellersListBuilder.dart';

sellersListBuilder = new SellersListBuilder();

class Viewer {
  viewSellers() {
    print(sellersListBuilder.build());
  }
}
