import 'package:get/get.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource_impl.dart';
import 'package:variacao_ativo/src/data/repository/ativo_repository_impl.dart';
import 'package:variacao_ativo/src/data/service/http_client_impl.dart';
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart';
import 'package:variacao_ativo/src/presentation/controller/home_controller.dart';

class AllBinding extends Bindings {

  @override
  Future<void> dependencies() async {

    Get.lazyPut<HomeController>(
      () => HomeController(
        ativoUseCase: AtivoUseCase(
           ativoRepository: AtivoRepositoryImpl(
             ativoDataSource: AtivoDataSourceImpl(
               http: HttpClientImp(client: GetConnect())
            ),
          ),
        ),
      ), fenix: true
    );
  }
}