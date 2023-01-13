import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/repository/ativo_repository.dart';

class AtivoUseCase {

  final AtivoRepository _ativoRepository;

  AtivoUseCase({
    required AtivoRepository ativoRepository,
  }) : _ativoRepository = ativoRepository;

  Future<Either<Exception, AtivoEntity>> getVariacaoAtivo() async {
    return await _ativoRepository.getVariacaoAtivo();
  }
}