import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<bool> postNavigation(String param) async {
    bool result = false;
    var url = Uri.parse("http://192.168.0.60:8080/api/navi/target/$param");
    await http.get(url).then((response) {
      result = true;
    }).catchError((err) {
      result = false;
    });
    return result;
  }

  Future<bool> navigationToCharge() async {
    bool result = false;
    var url = Uri.parse("http://192.168.0.60:8080/api/navi/charge");
    await http.get(url).then((response) {
      result = true;
    }).catchError((err) {
      result = false;
    });
    return result;
  }

  Future<String> movebaseStatus() async {
    String result = "";
    var url = Uri.parse("http://192.168.137.24/reeman/movebase_status");
    try {
      var response = await http.get(url);
      Map valueMap = json.decode(response.body);
      result = valueMap['status'].toString();
      return result;
    } catch (e) {
      result = e.toString();
      return result;
    }
  }
}
