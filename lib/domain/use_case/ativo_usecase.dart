import 'package:dartz/dartz.dart';
import 'package:variacao_ativo/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/domain/repository/ativo_repository.dart';

class AtivoUseCase {

  final AtivoRepository _ativoRepository;

  AtivoUseCase({
    required AtivoRepository ativoRepository,
  }) : _ativoRepository = ativoRepository;

  Future<Either<Exception, AtivoEntity>> getAtivos() async {
    return await _ativoRepository.getAtivos();
  }
}