import 'baseApiService.dart';

class SellerApi extends BaseApiService {
  var url;

  SellerApi(String u) //Определяем конструктор с параметрами
  {
    this.url = Uri.parse(u);
  }

  getsellers() {
    print('---from sellerApi---');
    print(super.get(this.url));
    print('---------------');

    // return SellerModel.sellerArrayBuilder(result).build(),
  }
}
