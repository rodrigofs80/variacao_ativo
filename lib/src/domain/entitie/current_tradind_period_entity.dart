import 'package:variacao_ativo/src/domain/entitie/current_trading_entity.dart';

class CurrentTradingPeriodEntity {

  final CurrentTradingEntity pre;
  final CurrentTradingEntity regular;
  final CurrentTradingEntity post;

  CurrentTradingPeriodEntity({required this.pre, required this.regular, required this.post});
}