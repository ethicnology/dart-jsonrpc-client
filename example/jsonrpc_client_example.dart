import 'package:jsonrpc_client/jsonrpc_client.dart';

void main() async {
  Client rpc = Client.withBasicAuth('127.0.0.1', 18332, false, 'user', 'pass');
  var response = await rpc.call("getblockchaininfo");
  print(response.result);
}
