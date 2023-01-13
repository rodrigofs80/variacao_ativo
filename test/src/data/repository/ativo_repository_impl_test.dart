import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/src/data/repository/ativo_repository_impl.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/repository/ativo_repository.dart';
import '../../mock/fixture.dart';
import '../../mock/mocks.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AtivoDataSource>(() => MockAtivoDataSource());
    Get.lazyPut<AtivoRepository>(() => AtivoRepositoryImpl(ativoDataSource: Get.find()));
  }
}

@GenerateMocks([AtivoRepository, AtivoDataSource])
void main() {

  late MockBinding binding;

  setUp((){
    binding = MockBinding();
  });

  group('Group variação ativo repository test', () {
    test('When repository call datasource get variação ativo with success, then return a variação ativo obj', () async {
      binding.dependencies();
      final datasource = Get.find<AtivoDataSource>();
      final repository = Get.find<AtivoRepository>();

      expect(datasource.isBlank, false);
      expect(repository.isBlank, false);

      when(datasource.getVariacaoAtivo()).thenAnswer((_) async => FixtureVariacaoAtivo.ativoEntityFake);
      final _result = await repository.getVariacaoAtivo();
      expect(_result, right(FixtureVariacaoAtivo.ativoEntityFake));
      verify(datasource.getVariacaoAtivo()).called(1);
    });

    test('When repository call datasource get variação ativo with error, then return a exception', () async {
      binding.dependencies();
      final datasource = Get.find<AtivoDataSource>();
      final repository = Get.find<AtivoRepository>();

      expect(datasource.isBlank, false);
      expect(repository.isBlank, false);

      when(datasource.getVariacaoAtivo()).thenThrow(Exception);
      final Either<Exception, AtivoEntity> _response = await repository.getVariacaoAtivo();
      final _result = _response.fold((Exception l) => l, (AtivoEntity r) => r);
      expect(_result, isA<Exception>());
      verify(datasource.getVariacaoAtivo()).called(1);
    });
  });
}