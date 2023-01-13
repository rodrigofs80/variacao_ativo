import 'package:flutter_test/flutter_test.dart';
import 'package:variacao_ativo/src/data/model/current_trading_model.dart';
import 'package:variacao_ativo/src/domain/entitie/current_trading_entity.dart';
import '../../mock/fixture.dart';

void main() {

  test('Test current trading model to json, to entity, to model', () {
    final Map<String, dynamic> json = JsonMock.currentTradingMock;
    expect(json, isA<Map<String, dynamic>>());
    final CurrentTradingModel model = CurrentTradingModel.fromJson(json);
    expect(model, isA<CurrentTradingModel>());
    final CurrentTradingEntity entity = CurrentTradingModel.fromJson(json).toEntity();
    expect(entity, isA<CurrentTradingEntity>());
    final Map<String, dynamic> nJson = CurrentTradingModel.fromJson(json).toJson();
    expect(nJson, isA<Map<String, dynamic>>());
  });
}