import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rest/models/seller_Model.dart';

class BaseApiService {
  Future<dynamic> get(Uri uri) {
    return http.get(uri).then((response) {
      final temp = jsonDecode(response.body);
      return temp;
    });
  }

  Future<dynamic> delete(Uri uri, String id) {
    print(id);
    print('uri: $uri');
    uri = Uri.parse(uri.toString() + '/?id=$id');
    return http.delete(uri).then((response) {
      final temp = jsonDecode(response.body);
      // print('response.body: ${response.body}');
      return response.body;
    });
  }

  Future<dynamic> patch(Uri uri, Map<String, String> parameters) {
    // print(id);
    // print('uri in patch: $uri');
    // print('info: $info');
    print(uri);
    print(parameters);

    // uri = Uri.parse(uri.toString() + '/?id=$id');
    return http.patch(uri, body: parameters).then((response) {
      // print('response $response');
      // final temp = jsonDecode(response);
      // print(response.body);
      return response.body;
    });
  }

// http.patch(
//       url,
//       body: {
//         "first_name": newTeacher.first_name,
//         "profile": "" //HOW DO I SHOULD SEND A MAP TO UPDATE LOCATION AND PROFESSION?
//       },
//       headers: {"Authorization": "JWT $authToken"},
//     )

  // Future<dynamic> patch(Uri uri, String id,SellerInfo sellerInfo) {
  //   print(id);
  //   print('uri in patch: $uri');
  //   uri = Uri.parse(uri.toString() + '/?id=$id');
  //   return http.patch(uri,String id, {jsonEncode("sellerInfo" : [sellerInfo])}).then((response) {
  //     final temp = jsonDecode(response.body);
  //     print('response.body: ${response.body}');
  //     return response.body;
  //   });
  // }

  // get(url) {
  //     return axios.get(url)
  //     .then(response => {
  //         return response.data
  //     })
  //     .catch(error => {
  //         console.log(`Error with BaseApiService by get from DB with error code: ${error}`)
  //     })
  // }

  // post(url, data) {
  //     axios.post(url, data)
  //     .then(function (response) {
  //         console.log(`${response} __________Added to DB`)
  //     })
  //     .catch(function (error) {
  //         console.log(`Something wrong with BaseApiService by post at DB with error code: ${error}`)
  //     });
  // }

  // put(url, data) {
  //     axios.post(url, data)
  //     .then(function (response) {
  //         console.log(`${response} __________Putted to DB`)
  //     })
  //     .catch(function (error) {
  //         console.log(`Something wrong with BaseApiService by put at DB with error code: ${error}`)
  //     });
  // }

  // delete(url, data) {
  //     axios.delet(url, data)
  //     .then(function (response) {
  //         console.log(`${response} deleted from ${url}`)
  //     })
  //     .catch(function (error) {
  //         console.log(`Something wrong with BaseApiService by delete record ${data} from ${url} DB with error code: ${error}`)
  //     });
  // }

}

// var instanceBaseApi = new BaseApiService;

// instanceBaseApi.get('http://localhost:3000/seller');
