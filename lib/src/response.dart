class Response {
  final dynamic jsonrpc;
  final dynamic result;
  final dynamic error;
  final dynamic id;

  Response(this.result, this.error, this.id, this.jsonrpc);

  Response.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        result = json['result'],
        error = json['error'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'jsonrpc': jsonrpc,
        'result': result,
        'error': error,
        'id': id,
      };
}
