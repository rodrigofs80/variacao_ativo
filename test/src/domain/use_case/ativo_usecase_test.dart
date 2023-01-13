import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/repository/ativo_repository.dart';
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart';
import '../../mock/fixture.dart';
import '../../mock/mocks.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AtivoRepository>(() => MockAtivoRepository());
    Get.lazyPut<AtivoUseCase>(() => AtivoUseCase(ativoRepository: Get.find()));
  }
}

void main() {

  late MockBinding binding;

  setUp((){
    binding = MockBinding();
  });

  group('Group Usecase variação ativo test', () {

    test('When usecase call repository get variação ativo with success, then return a variação ativo obj', () async {
      binding.dependencies();
      final repository = Get.find<AtivoRepository>();
      final usecase = Get.find<AtivoUseCase>();

      expect(repository.isBlank, false);
      expect(usecase.isBlank, false);

      when(repository.getVariacaoAtivo()).thenAnswer((_) async => right(FixtureVariacaoAtivo.ativoEntityFake));
      final _result = await usecase.getVariacaoAtivo();
      expect(_result, right(FixtureVariacaoAtivo.ativoEntityFake));
      verify(repository.getVariacaoAtivo()).called(1);
    });

    test('When usecase call repository get variação ativo with error, then return a exception', () async {
      binding.dependencies();
      final repository = Get.find<AtivoRepository>();
      final usecase = Get.find<AtivoUseCase>();

      expect(repository.isBlank, false);
      expect(usecase.isBlank, false);

      when(repository.getVariacaoAtivo()).thenAnswer((_) async => left(Exception()));
      final Either<Exception, AtivoEntity> _response = await usecase.getVariacaoAtivo();
      final Object _result = _response.fold((Exception l) => l, (AtivoEntity r) => r);
      expect(_result, isA<Exception>());
      verify(repository.getVariacaoAtivo()).called(1);
    });
  });
}