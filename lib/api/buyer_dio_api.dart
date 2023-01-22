import '../models/buyer_model.dart';
import '../builders/buyers_list_builder.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class BuyerApiByDio {
  Uri buyersDefUri = Uri.parse('http://localhost:3000/buyer');

  // BaseOptions options = BaseOptions(
  //   baseUrl: 'http://localhost:3000/buyer',
  //   connectTimeout: 3000,
  //   receiveTimeout: 3000,
  // );

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

//   void getBuyersWith2Callbacks(
//       Function(List<BuyerModel>? buyersList, dynamic msg) callback) {
//     super.getWith2Callbacks(
//       buyersDefUri,
//       (resp, errResp) {
//         // var sellers = SellersListBuilder.build(resp);

//         callback(
//           BuyersListBuilder.build(resp) /*sellers*/,
//           errResp,
//         );
//       },
//     );
//   }

  void getBuyersWith2Callbacks(
      Function(List<BuyerModel>? buyersList, dynamic msg) callback) {
    Dio dio = new Dio();

    try {
      dio.get(buyersDefUri.toString()).then((value) {
        callback(BuyersListBuilder.build(jsonDecode(value.data)), null);
      }).catchError((onError) => null);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.data.toString());
        print(e.response?.headers);
        print(e.response?.requestOptions);
        callback(null, e.response?.data);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        callback(null, e.message.toString());
      }
    }

    //  } catch(e) {
    //   print(e);
    //  }
    // try {
    //     dio.get("http://localhost:3000/buyer" ,Function(dynamic resp, dynamic errResp) callback){
    //     // print("Response:");
    //     // print("Status:\n${resp.statusCode}");
    //     // print("Header:\n${resp.headers}");
    //     // print("Data:\n${resp.data}");
    //   } catch (e) {
    //     print("Exception: $e");
    //   }
  }

//   Future<dynamic> patchBuyer(BuyerModel buyerModel) {
//     Map<String, dynamic> body = buyerModel.toFormatJson();
//     return super.patch(buyersDefUri, body).then((response) {
//       print('buyerApi: ${response}');
//     });
//   }

//   void patchBuyerWith2Callbacks(BuyerModel buyerModel,
//       Function(BuyerModel? response, dynamic errResp) callback) {
//     super.patchWith2Callbacks(
//       buyersDefUri,
//       buyerModel.toFormatJson(),
//       (resp, errResp) {
//         // if (resp != null) {
//         //   callback(SellerModel.fromJson(resp), null);
//         // } else {
//         //   callback(null, errResp);
//         // }
//         callback(resp != null ? BuyerModel.fromJson(resp) : null, errResp);
//       },
//     );
//   }

//   Future<dynamic> deleteBuyer(id) {
//     return super.delete(buyersDefUri, id).then((response) {
//       return response;
//     });
//   }
}
