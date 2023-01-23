import '../models/buyer_model.dart';
import '../builders/buyers_list_builder.dart';
import 'package:dio/dio.dart';

//////////////////////////////////////////////

class BuyerApi {
  Uri buyersDefUri = Uri.parse('http://localhost:3000/buyer');

//   Future<List<BuyerModel>> getBuyers() {
//     return super.get(buyersDefUri).then((response) {
//       print(response);
//       return BuyersListBuilder.build(response);
//     });
//   }

//   void getBuyersWithCallback(
//       Function(List<BuyerModel> buyersList) successCallback,
//       Function(dynamic msg) failCallback) {
//     super.getWithCallback(buyersDefUri, (resp) {
//       successCallback(BuyersListBuilder.build(resp));
//     }, (errResp) {
//       failCallback(errResp);
//     });
//   }

  void getBuyersWith2Callbacks(
      Function(List<BuyerModel>? buyersList, dynamic msg) callback) {
    Dio dio = new Dio();
    dio.getUri(buyersDefUri).then((value) {
      callback(BuyersListBuilder.build(value.data), null);
    }).catchError((onError) {
      callback(null, onError.toString());
    });
  }

//   Future<dynamic> patchBuyer(BuyerModel buyerModel) {
//     Map<String, dynamic> body = buyerModel.toFormatJson();
//     return super.patch(buyersDefUri, body).then((response) {
//       print('buyerApi: ${response}');
//     });
//   }

  void patchBuyerWith2Callbacks(BuyerModel buyerModel,
      Function(BuyerModel? response, dynamic errResp) callback) {
    Dio dio = new Dio();
    dio.patchUri(buyersDefUri, data: buyerModel).then((value) {
      callback(BuyerModel.fromJson(value.data), null);
    }).catchError((onError) {
      callback(null, onError.toString());
    });
  }

//   Future<dynamic> deleteBuyer(id) {
//     return super.delete(buyersDefUri, id).then((response) {
//       return response;
//     });
//   }
}
