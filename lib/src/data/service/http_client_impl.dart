import 'package:variacao_ativo/src/domain/entitie/http_response.dart';
import 'package:variacao_ativo/src/domain/service/http_service.dart';
import 'package:get/get_connect/connect.dart';

class HttpClientImp implements HttpService {

  final GetConnect _client;

  const HttpClientImp({
    required GetConnect client,
  }) : _client = client;

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _client.get(url);
    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}