import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/src/data/model/quote_model.dart';
import 'package:variacao_ativo/src/domain/entitie/indicator_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class IndicatorModel extends IndicatorEntity {

  @JsonKey(name: 'quote', required: true)
  final List<QuoteModel> quote;

  IndicatorModel({
    required this.quote,
  }) : super(quote: quote);

  factory IndicatorModel.fromJson(Map<dynamic, dynamic> json){
    List<QuoteModel> temp = [];
    for(var resultEntity in json['quote']){
      temp.add(QuoteModel.fromJson(resultEntity));
    }
    return IndicatorModel(
      quote: temp,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    return data;
  }

  IndicatorEntity toEntity() => _$IndicatorModelToEntity(this);
}

IndicatorEntity _$IndicatorModelToEntity(IndicatorEntity model) {
  return IndicatorEntity(
    quote: model.quote,
  );
}