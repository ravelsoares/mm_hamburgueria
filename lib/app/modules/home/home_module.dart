import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/home/home_page.dart';
import 'package:mm_hamburgueria/app/modules/products/controller/cart_controller.dart';

class HomeModule extends Module{
  @override
  List<Bind<Object>> get binds => [];
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage(controller: Modular.get<CartController>(),))
  ];
}