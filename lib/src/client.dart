import 'dart:convert';
import 'package:http/http.dart' as http;
import 'response.dart';

class Client {
  String host;
  int port;
  String version;
  String user = "";
  String pass = "";
  String auth = "";
  late Uri url;

  Client(
    this.host,
    this.port,
    this.version,
  ) {
    url = Uri.parse('$host:$port');
  }

  Client.withBasicAuth(
    this.host,
    this.port,
    this.version,
    this.user,
    this.pass,
  ) {
    url = Uri.parse('$host:$port');
    auth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));
  }

  Future<Response> call(String method, {params = const []}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': auth
    };
    var body = jsonEncode({
      'jsonrpc': version,
      'method': method,
      'params': params,
      'id': '${DateTime.now().millisecondsSinceEpoch}'
    });
    try {
      var response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return Response.fromJson(json);
      } else {
        throw Exception('HTTP ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
