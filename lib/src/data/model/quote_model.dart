import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/src/domain/entitie/quote_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class QuoteModel extends QuoteEntity {

  @JsonKey(name: 'volume', required: true)
  final List<int> volume;

  @JsonKey(name: 'high', required: true)
  final List<double> high;

  @JsonKey(name: 'open', required: true)
  final List<double> open;

  @JsonKey(name: 'low', required: true)
  final List<double> low;

  @JsonKey(name: 'close', required: true)
  final List<double> close;

  QuoteModel({
    required this.volume,
    required this.high,
    required this.open,
    required this.low,
    required this.close,
  }) : super(volume: volume, high: high, open: open, low: low, close: close);

  factory QuoteModel.fromJson(Map<dynamic, dynamic> json){
    List<int> vl = [];
    for(var vol in json['volume']){
      vol != null ? vl.add(vol) : vl.add(0);
    }
    List<double> hi = [];
    for(var hig in json['high']){
      hig != null ? hi.add(hig) : hi.add(0);
    }
    List<double> op = [];
    for(var ope in json['open']){
      ope != null ? op.add(ope) : op.add(0);
    }
    List<double> lo = [];
    for(var low in json['low']){
      low != null ? lo.add(low) : lo.add(0);
    }
    List<double> cl = [];
    for(var clo in json['close']){
      clo != null ? cl.add(clo) : cl.add(0);
    }
    return QuoteModel(
      volume: vl,
      high: hi,
      open: op,
      low: lo,
      close: cl,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['volume'] = volume;
    data['high'] = high;
    data['open'] = open;
    data['low'] = low;
    data['close'] = close;
    return data;
  }

  QuoteEntity toEntity() => _$QuoteModelToEntity(this);
}

QuoteEntity _$QuoteModelToEntity(QuoteEntity model) {
  return QuoteEntity(
    volume: model.volume,
    high: model.high,
    open: model.open,
    low: model.low,
    close: model.close,
  );
}