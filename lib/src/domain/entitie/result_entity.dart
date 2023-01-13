import 'package:variacao_ativo/src/domain/entitie/indicator_entity.dart';
import 'package:variacao_ativo/src/domain/entitie/meta_entity.dart';

class ResultEntity {

  final MetaEntity meta;
  final List<int> timestamp;
  final IndicatorEntity indicators;

  ResultEntity({required this.meta, required this.timestamp, required this.indicators});
}