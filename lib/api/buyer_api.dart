import '../models/buyer_model.dart';
import './base_api_service.dart';
import '../builders/buyers_list_builder.dart';

class BuyerApi extends BaseApiService {
  Uri buyersDefUri = Uri.parse('http://localhost:3000/buyer');

  Future<List<BuyerModel>> getBuyers() {
    return super.get(buyersDefUri).then((response) {
      print(response);
      return BuyersListBuilder.build(response);
    });
  }

  void getBuyersWithCallback(
      Function(List<BuyerModel> buyersList) successCallback,
      Function(dynamic msg) failCallback) {
    super.getWithCallback(buyersDefUri, (resp) {
      successCallback(BuyersListBuilder.build(resp));
    }, (errResp) {
      failCallback(errResp);
    });
  }

  void getBuyersWith2Callbacks(
      Function(List<BuyerModel>? buyersList, dynamic msg) callback) {
    super.getWith2Callbacks(
      buyersDefUri,
      (resp, errResp) {
        callback(
          BuyersListBuilder.build(resp),
          errResp,
        );
      },
    );
  }

  Future<dynamic> patchBuyer(BuyerModel buyerModel) {
    Map<String, dynamic> body = buyerModel.toFormatJson();
    return super.patch(buyersDefUri, body).then((response) {
      print('buyerApi: ${response}');
    });
  }

  void patchBuyerWith2Callbacks(BuyerModel buyerModel,
      Function(BuyerModel? response, dynamic errResp) callback) {
    super.patchWith2Callbacks(
      buyersDefUri,
      buyerModel.toFormatJson(),
      (resp, errResp) {
        callback(resp != null ? BuyerModel.fromJson(resp) : null, errResp);
      },
    );
  }

  Future<dynamic> deleteBuyer(id) {
    return super.delete(buyersDefUri, id).then((response) {
      return response;
    });
  }
}
