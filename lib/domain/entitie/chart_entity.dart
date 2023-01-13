import 'package:variacao_ativo/domain/entitie/result_entity.dart';

class ChartEntity {

  final List<ResultEntity> result;
  final String error;

  ChartEntity({required this.result, required this.error});
}