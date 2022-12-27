import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:async';

class BaseApiService {
  get(uri) {
    // make request
    return http.get(uri).then((response) => response.body);
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
