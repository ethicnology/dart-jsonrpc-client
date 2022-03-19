import 'package:jsonrpc_client/jsonrpc_client.dart';
import 'package:test/test.dart';

void main() {
  test('bitcoin-core getblockchaininfo rpc', () async {
    Client rpc =
        Client.withBasicAuth('http://127.0.0.1', 18332, '1.0', 'user', 'pass');
    var response = await rpc.call("getblockchaininfo");
    expect(response.result != null, isTrue);
  });
}
