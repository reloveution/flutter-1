import 'baseApiService.dart';

class SellerApi extends BaseApiService {
  var url;

  SellerApi(String u) //Определяем конструктор с параметрами
  {
    this.url = Uri.parse(u);
  }

  getsellers() {
    // print(super.get(this.url));
    // print('Hello World!');
    String sellers = super.get(this.url);
    sellers;
    // return SellerModel.sellerArrayBuilder(result).build(),
  }
}
