import 'baseApiService.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUrl = Uri.parse('http://localhost:3000/seller');

  getsellers() {
    print('---from sellerApi---');
    return super.get(sellersDefUrl).then((response) => response);
  }
}
