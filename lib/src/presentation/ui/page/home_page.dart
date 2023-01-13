import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/src/presentation/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller.getVariacaoAtivo();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Home', 'Grafico'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() => controller.error.value != '' ? const SizedBox(
          child: Center(
            child: Text('Erro ao buscar variação!'),
          ),
          ) : controller.isLoading.value ?
          const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ) : controller.isGrafico.value ? _showGrafico() : _buildGrid()
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Home': controller.showGrafico(false); break;
      case 'Grafico':  controller.showGrafico(true); break;
    }
  }

  Widget _buildGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Operação',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Data/Hora',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Valor',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '(%) variação D-1',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '(%) variação 1º data',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: controller.datas.map((dt)  =>
                DataRow(cells: [
                  DataCell(Text((controller.datas.indexOf(dt)+1).toString())),
                  DataCell(Text(dt)),
                  DataCell(Text('R\$ ${controller.opens.elementAt(controller.datas.indexOf(dt))}')),
                  DataCell(Text(controller.varicaoD1.elementAt(controller.datas.indexOf(dt)))),
                  DataCell(Text(controller.varicaoPrimeiraData.elementAt(controller.datas.indexOf(dt)))),
                ])).toList(growable: false)
        ),
      ),
    );
  }

  Widget _showGrafico(){
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Sparkline(
          data: controller.variation,
          lineColor: Colors.lightGreen,
          fillMode: FillMode.below,
          fillColor: Colors.lightGreen.shade200,
          pointsMode: PointsMode.atIndex,
          useCubicSmoothing: true,
          lineWidth: 2.0,
          gridLinelabelPrefix: '% ',
          gridLineLabelPrecision: 4,
          enableGridLines: true,
          kLine: const ['max', 'min', 'first', 'last'],
          lineGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.purple.shade200],
          ),
          fillGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red.shade800, Colors.red.shade300],
          ),
        ),
      )
    );
  }
}