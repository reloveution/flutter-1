import '../models/seller_model.dart';
import './base_api_service.dart';
import '../builders/sellers_list_builder.dart';

class SellerApi extends BaseApiService {
  Uri sellersDefUri = Uri.parse('http://localhost:3000/seller');

  Future<List<SellerModel>> getSellers() {
    return super.get(sellersDefUri).then((response) {
      print(response);
      return SellersListBuilder.build(response);
    });
  }

  void getSellersWithCallback(
      Function(List<SellerModel> sellersList) successCallback,
      Function(dynamic msg) failCallback) {
    super.getWithCallback(sellersDefUri, (resp) {
      successCallback(SellersListBuilder.build(resp));
    }, (errResp) {
      failCallback(errResp);
    });
  }

  void getSellersWith2Callbacks(
      Function(List<SellerModel>? sellersList, dynamic msg) callback) {
    super.getWith2Callbacks(
      sellersDefUri,
      (resp, errResp) {
        // var sellers = SellersListBuilder.build(resp);

        callback(
          SellersListBuilder.build(resp) /*sellers*/,
          errResp,
        );
      },
    );
  }

  Future<dynamic> patchSeller(SellerModel sellerModel) {
    Map<String, String> body = sellerModel.toFormatJson();
    return super.patch(sellersDefUri, body).then((response) {
      print('selllerApi: ${response}');
    });
  }

  void patchSellerWith2Callbacks(SellerModel sellerModel,
      Function(SellerModel? response, dynamic errResp) callback) {
    super.patchWith2Callbacks(
      sellersDefUri,
      sellerModel.toFormatJson(),
      (resp, errResp) {
        // if (resp != null) {
        //   callback(SellerModel.fromJson(resp), null);
        // } else {
        //   callback(null, errResp);
        // }
        callback(resp != null ? SellerModel.fromJson(resp) : null, errResp);
      },
    );
  }

  Future<dynamic> deleteSeller(id) {
    return super.delete(sellersDefUri, id).then((response) {
      return response;
    });
  }
}
