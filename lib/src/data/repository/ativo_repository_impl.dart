import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/repository/ativo_repository.dart';

class AtivoRepositoryImpl extends AtivoRepository {

  final AtivoDataSource _ativoDataSource;

  AtivoRepositoryImpl({
    required AtivoDataSource ativoDataSource,
  }) : _ativoDataSource = ativoDataSource;

  @override
  Future<Either<Exception, AtivoEntity>> getVariacaoAtivo() async {
    try {
      final AtivoEntity _result = await _ativoDataSource.getVariacaoAtivo();
      await Future.delayed(const Duration(seconds: 3));
      return right(_result);
    } catch (e) {
      return left(Exception());
    }
  }
}