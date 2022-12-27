import 'baseApiService.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUrl = Uri.parse('http://localhost:3000/seller');

  getsellers() {
    print('---from sellerApi---');
    super.get(sellersDefUrl).then((result) => result);
  }
}
