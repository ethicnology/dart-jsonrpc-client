import 'package:jsonrpc_client/jsonrpc_client.dart';

void main() async {
  Client rpc =
      Client.withBasicAuth('http://127.0.0.1', 18332, '1.0', 'user', 'pass');
  var response = await rpc.call("getblockchaininfo");
  print(response.result);
}
