import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';

abstract class AtivoDataSource {

  Future<AtivoEntity> getVariacaoAtivo();
}