import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseApiService {
  Future<dynamic> get(Uri uri) {
    return http.get(uri).then((response) {
      return jsonDecode(response.body);
    }).catchError((error) {
      return jsonDecode(error);
    });
  }

  void getWithCallback(Uri uri, Function(dynamic resp) successCallback,
      Function(dynamic errResp) failCallback) {
    http.get(uri).then((response) {
      successCallback(jsonDecode(response.body));
    }).catchError((error) {
      failCallback(error);
    });
  }

  void getWith2Callbacks(
      Uri uri, Function(dynamic resp, dynamic errResp) callback) {
    http.get(uri).then((response) {
      callback(jsonDecode(response.body), null);
    }).catchError((error) {
      callback(null, error);
    });
  }

  void patchWith2Callbacks(Uri uri, Map<String, dynamic> parameters,
      Function(dynamic resp, dynamic errResp) callback) {
    http.patch(uri, body: parameters).then((response) {
      if (response.statusCode != 200) {
        callback(null, response.reasonPhrase);
      } else {
        callback(response.body, null);
      }
    }).catchError((error) {
      callback(null, error);
    });
  }

  Future<dynamic> patch(Uri uri, Map<String, dynamic> parameters) {
    return http.patch(uri, body: parameters).then((response) {
      return response.body;
    });
  }

  Future<dynamic> delete(Uri uri, String id) {
    uri = Uri.parse(uri.toString() + '/?id=$id');
    return http.delete(uri).then((response) {
      return response.body;
    });
  }

  // post(url, data) {
  //     axios.post(url, data)
  //     .then(function (response) {
  //         console.log(`${response} __________Added to DB`)
  //     })
  //     .catch(function (error) {
  //         console.log(`Something wrong with BaseApiService by post at DB with error code: ${error}`)
  //     });
  // }

}
