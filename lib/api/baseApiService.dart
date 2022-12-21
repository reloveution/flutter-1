import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:async';

class BaseApiService {
  get(url) {
    // make request
    http.get(url).then((response) => {
          // print(response.statusCode)
          // print(response.body),
          print('--from baseApiService----'),
          print(response.body),
          print(response.body.runtimeType),
          response.body
          // print((convert.jsonDecode(response.body) as Map<dynamic, String>))
          // convert.jsonDecode(response.body) as Map<String, dynamic>,
        });

    // Future response = http.get(url);
    //   response.then((value) =>
    //   var jsonReponse =

    // )

    // if (response.statusCode == 200) {
    //     var jsonResponse =
    //         convert.jsonDecode(response.body) as Map<String, dynamic>;
    //     var itemCount = jsonResponse['totalItems'];
    //     print('Number of books about http: $itemCount.');
    //   } else {
    //     print('Request failed with status: ${response.statusCode}.');
    //   }

    // var response = jsonDecode(Uri.parse(url));
    // String verse = data["contents"]["verse"];
    // dynamic chapter= data["contents"]["chapter"];

    // // sample info available in response
    // int statusCode = response.statusCode;
    // Map<String, String> headers = response.headers;
    // String contentType = headers['content-type'];
    // String json = response.body;

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(json)));
  }

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
