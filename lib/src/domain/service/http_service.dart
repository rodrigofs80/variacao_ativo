import 'package:variacao_ativo/src/domain/entitie/http_response.dart';

abstract class HttpService {

  Future<HttpResponse> get(String url);
}