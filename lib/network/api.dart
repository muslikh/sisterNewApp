import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'https://sister.smkn1prigen.sch.id/api/';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // token = jsonDecode(localStorage.getString('token'))['token'];
    token = localStorage.getString('token');
  }

  auth(data, apiURL) async {
    // try{
    var fullUrl = _url + apiURL;
    // await http.post(fullUrl,
    //     body: jsonEncode(data), headers: _setHeaders())

    return await http.post(Uri.parse(fullUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data));

    // print(response);

    // }catch(e){
    //   print(e.toString());
    // }
  }

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  logout(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.post(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer $token',
      };
}
