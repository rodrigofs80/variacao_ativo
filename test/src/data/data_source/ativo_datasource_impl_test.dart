import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource_impl.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/entitie/http_response.dart';
import 'package:variacao_ativo/src/domain/service/http_service.dart';
import '../../mock/fixture.dart';
import '../../mock/mocks.dart';

class MockBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HttpService>(() => MockHttpService());
    Get.lazyPut<AtivoDataSource>(() => AtivoDataSourceImpl(http: Get.find()));
  }
}

@GenerateMocks([AtivoDataSource, HttpService])
main() {

  TestWidgetsFlutterBinding.ensureInitialized();
  late MockBinding binding;

  setUp((){
    Get.testMode = true;
    binding = MockBinding();
  });

  group('Group variação ativo datasource impl', () {
    test('When datasource call get variação ativo with success, then return a variação ativo obj', () async {
      binding.dependencies();
      final _service = Get.find<HttpService>();
      final _datasource = Get.find<AtivoDataSource>();
      expect(_service.isBlank, false);
      expect(_datasource.isBlank, false);

      const String path = 'https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA';

      HttpResponse hr = HttpResponse(data: JsonMock.ativoEntityMock, statusCode: 200);
      when(_service.get(path)).thenAnswer((_) async => hr);
      final _resp = await _datasource.getVariacaoAtivo();
      expect(_resp, isA<AtivoEntity>());
      verify(_service.get(path)).called(1);
    });

    test('When datasource call get variação ativo with error, then return a exception', () async {
      binding.dependencies();
      final _service = Get.find<HttpService>();
      final _datasource = Get.find<AtivoDataSource>();
      expect(_service.isBlank, false);
      expect(_datasource.isBlank, false);

      const String path = 'https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA';

      when(_service.get(path)).thenThrow(Exception());
      expect(() async => await _datasource.getVariacaoAtivo(), throwsA(isA<Exception>()));
      verify(_service.get(path)).called(1);
    });
  });
}