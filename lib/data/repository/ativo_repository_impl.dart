import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/domain/repository/ativo_repository.dart';

class AtivoRepositoryImpl extends AtivoRepository {

  final AtivoDataSource _ativoDataSource;

  AtivoRepositoryImpl({
    required AtivoDataSource ativoDataSource,
  }) : _ativoDataSource = ativoDataSource;

  @override
  Future<Either<Exception, AtivoEntity>> getAtivos() async {
    try {
      final AtivoEntity _result = await _ativoDataSource.getAtivos();
      await Future.delayed(const Duration(seconds: 3));
      return right(_result);
    } catch (e) {
      return left(Exception());
    }
  }
}