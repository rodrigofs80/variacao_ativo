import 'package:variacao_ativo/domain/entitie/http_response.dart';

abstract class HttpService {

  Future<HttpResponse> get(String url);
}