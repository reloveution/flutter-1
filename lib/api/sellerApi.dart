import 'baseApiService.dart';

class SellerApi extends BaseApiService {
  getsellers() {
    print('---from sellerApi---');
    return super.get().then((result) => {print(result)});
  }
}
