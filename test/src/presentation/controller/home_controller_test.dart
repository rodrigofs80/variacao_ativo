import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart';
import 'package:variacao_ativo/src/presentation/controller/home_controller.dart';
import '../../mock/fixture.dart';
import '../../mock/mocks.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AtivoUseCase>(() => MockAtivoUseCase());
    Get.lazyPut<HomeController>(() => HomeController(ativoUseCase: Get.find()));
  }
}

@GenerateMocks([HomeController, AtivoUseCase])
void main() {

  late MockBinding binding;

  setUp((){
    binding = MockBinding();
  });

  group('Group Home Controller variação ativo test', () {

    test('When home controller call get variacao ativo service and return success, then a obj variacao ativo is full', () async {
      binding.dependencies();
      final usecase = Get.find<AtivoUseCase>();
      final controller = Get.find<HomeController>();

      expect(controller.initialized, true);
      expect(usecase.isBlank, false);

      when(usecase.getVariacaoAtivo()).thenAnswer((_) async => right(FixtureVariacaoAtivo.ativoEntityFake));
      await controller.getVariacaoAtivo();
      expect(controller.ativoEntity.value, FixtureVariacaoAtivo.ativoEntityFake);
    });

    test('When home controller call get variacao ativo service and return error, then return a exception msg', () async {
      binding.dependencies();
      final usecase = Get.find<AtivoUseCase>();
      final controller = Get.find<HomeController>();

      expect(controller.initialized, true);
      expect(usecase.isBlank, false);

      when(usecase.getVariacaoAtivo()).thenAnswer((_) async => left(Exception()));
      await controller.getVariacaoAtivo();
      expect(controller.error, isA<RxString>());
    });
  });
}