import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart';
import 'package:variacao_ativo/src/util/util.dart';

class HomeController extends GetxController {

  final AtivoUseCase _ativoUseCase;

  HomeController({ required AtivoUseCase ativoUseCase }) : _ativoUseCase = ativoUseCase;

  static const LIMITE = 30;
  final title = 'Variação de preço'.obs;
  final isLoading = false.obs;
  final isGrafico = false.obs;
  final error = ''.obs;
  final datas = <String>[].obs;
  final opens = <String>[].obs;
  final variation = <double>[].obs;
  final ativoEntity = AtivoEntity(null).obs;
  final d1 = 0.0.obs;
  final varicaoD1 = <String>[].obs;
  final varicaoPrimeiraData = <String>[].obs;
  final n1 = 0.0.obs;
  final n2 = 0.0.obs;

  _setDatas(List<int> dts){
    datas.clear();
    for(var dt in dts){
      var data = Util.timestampToDate(dt);
      datas.add(data);
    }
  }

  _setOpens(List<double> ops){
    opens.clear();
    for(var open in ops){
      var data = Util.formatDecimalDouble(open);
      opens.add(data);
    }
  }

  showGrafico(bool show){
    isGrafico.value = show;
    _changeTitle(show);
  }

  _changeTitle(bool change){
    if(change){
      title.value = 'Gráfico da variação';
    } else {
      title.value = 'Variação de preço';
    }
  }

  getVariacaoAtivo() async {
    try {
      isLoading(true);
      final Either<Exception, AtivoEntity> _result = await _ativoUseCase.getVariacaoAtivo();
      _result.fold(
              (Exception l) => error(l.toString()),
              (AtivoEntity r) => ativoEntity(r)
      );
      _populate();
    } catch (e){
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  _populate(){
    varicaoD1.add('-');
    varicaoPrimeiraData.add('-');
    _setDatas(ativoEntity.value.chart!.result[0].timestamp.getRange(0, LIMITE).toList());
    _setOpens(ativoEntity.value.chart!.result[0].indicators.quote[0].open.getRange(0, LIMITE).toList());
    d1.value = ativoEntity.value.chart!.result[0].indicators.quote[0].open[0];
    _calculate();
  }

  _calculate(){
    for (var i = 1; i < LIMITE; i++) {
      n2.value = _getOpensByIndex(i);
      n1.value = _getOpensByIndex(i - 1);
      var x = Util.calculate(n1.value, n2.value);
      varicaoD1.add(x.toStringAsFixed(2));
      var y = Util.calculate(d1.value, n2.value);
      varicaoPrimeiraData.add(y.toStringAsFixed(2));
    }
    _converter();
  }

  _converter(){
    variation.clear();
    variation.addAll(opens.map(double.parse).toList());
  }

  double _getOpensByIndex(int i){
    return double.parse(opens.elementAt(i));
  }
}