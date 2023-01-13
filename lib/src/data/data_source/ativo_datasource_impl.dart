import 'package:flutter/material.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/src/data/model/ativo_model.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/service/http_service.dart';

class AtivoDataSourceImpl extends AtivoDataSource {

  final HttpService _http;

  static const String path = 'https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA';

  AtivoDataSourceImpl({
    required HttpService http,
  }) : _http = http;

  @override
  Future<AtivoEntity> getVariacaoAtivo() async {
    try {
      final response = await _http.get(path);
      final data = response.data;
      final AtivoEntity _result = AtivoModel.fromJson(data).toEntity();
      return _result;
    } catch (e) {
      debugPrint(e.toString());
      throw e as Exception;
    }
  }
}