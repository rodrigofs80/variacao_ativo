import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/src/presentation/binding/bindings.dart';
import 'package:variacao_ativo/src/presentation/ui/page/home_page.dart';
import 'package:variacao_ativo/src/presentation/ui/page/splash_page.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio Guide TI',
      debugShowCheckedModeBanner: false,
      initialBinding: AllBinding(),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const Splash(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
      ],
    );
  }
}