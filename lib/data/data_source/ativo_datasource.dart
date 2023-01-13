import 'package:variacao_ativo/domain/entitie/ativo_entity.dart';

abstract class AtivoDataSource {

  Future<AtivoEntity> getAtivos();
}