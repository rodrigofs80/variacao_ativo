import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/domain/entitie/ativo_entity.dart';

abstract class AtivoRepository {

  Future<Either<Exception, AtivoEntity>> getAtivos();
}