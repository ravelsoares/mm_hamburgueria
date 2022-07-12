import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/home/home_page.dart';
import 'package:mm_hamburgueria/app/modules/products/controller/cart_controller.dart';

class HomeModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<CartController>((i) => CartController(cartRepository: Modular.get()))
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage(cartController: Modular.get(), cartRepository: Modular.get(),))
  ];
}