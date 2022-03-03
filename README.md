# dart-jsonrpc-client 
makes easy to communicate through [JSON-RPC](https://jsonrpg.org) 1.0 & 2.0 over HTTP in [dart lang](https://dart.dev) and [flutter](https://flutter.dev)

## Features
- [JSON-RPC 1.0](https://jsonrpg.org/specification_v1)
- [JSON-RPC 2.0](https://jsonrpg.org/specification)
- Basic authentication: [RFC 7617](https://datatracker.ietf.org/doc/html/rfc7617)

## Usage

This show how to query a [bitcoin-core](https://developer.bitcoin.org/reference/rpc/) node with basic authentication

```dart
import 'package:jsonrpc_client/jsonrpc_client.dart';

void main() async {
  var rpc = Client.withBasicAuth('127.0.0.1', 18332, '1.0', false, 'user', 'pass');
  var response = await rpc.call("getblockchaininfo");
  print(response.result);
}
```

## Security notice

[Basic Authentication](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) scheme used as it sends the credentials encoded but not encrypted. This would be completely insecure unless the exchange was over a secure connection (HTTPS/TLS).** 

To improve the security please take a look at [bitcoin script rpcauth.py](https://github.com/bitcoin/bitcoin/blob/master/share/rpcauth/rpcauth.py) it provide a way to generate a hashed password.
