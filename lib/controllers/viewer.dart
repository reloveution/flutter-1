import '../builders/sellersListBuilder.dart';

class Viewer {
  sellers() {
    SellersListBuilder sellersListBuilder = new SellersListBuilder();
    print('---from Viewer---');
    return sellersListBuilder.build() /*.then((response) => response)*/;
  }
}
