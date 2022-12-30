import 'baseApiService.dart';
import '../builders/sellersListBuilder.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUrl = Uri.parse('http://localhost:3000/seller');

  // getsellers() {
  //   return super.get(sellersDefUrl).then((response) => response);
  // }

  getSellers() {
    return super
        .get(sellersDefUrl)
        .then((response) => SellersListBuilder.build(response));
  }
}
