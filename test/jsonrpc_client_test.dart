import 'package:jsonrpc_client/jsonrpc_client.dart';
import 'package:test/test.dart';

void main() {
  test('bitcoin-core getblockchaininfo rpc', () async {
    Client rpc =
        Client.withBasicAuth('127.0.0.1', 18332, '1.0', false, 'user', 'pass');
    var response = await rpc.call("getblockchaininfo");
    expect(response.result != null, isTrue);
  });
}
