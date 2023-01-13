import 'package:variacao_ativo/src/domain/entitie/result_entity.dart';

class ChartEntity {

  final List<ResultEntity> result;
  final String error;

  ChartEntity({required this.result, required this.error});
}