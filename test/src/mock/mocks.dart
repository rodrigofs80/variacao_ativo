import 'package:mockito/mockito.dart';
import 'package:variacao_ativo/src/data/data_source/ativo_datasource.dart';
import 'package:variacao_ativo/src/domain/repository/ativo_repository.dart';
import 'package:variacao_ativo/src/domain/service/http_service.dart';
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart';

class MockAtivoUseCase extends Mock implements AtivoUseCase {}

class MockAtivoRepository extends Mock implements AtivoRepository {}

class MockAtivoDataSource extends Mock implements AtivoDataSource {}

class MockHttpService extends Mock implements  HttpService {}