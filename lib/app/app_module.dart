import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/home/home_module.dart';
import 'package:mm_hamburgueria/app/modules/home/home_page.dart';
import 'package:mm_hamburgueria/app/modules/products/controller/cart_controller.dart';
import 'package:mm_hamburgueria/app/modules/products/product_module.dart';
import 'package:mm_hamburgueria/app/repository/cart/cart_repository.dart';
import 'package:mm_hamburgueria/app/repository/cart/cart_repository_impl.dart';


class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<CartRepository>((i) => CartRepositoryImpl()),
    Bind.lazySingleton<CartController>((i) => CartController(cartRepository: Modular.get<CartRepository>()))
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage(cartRepository: Modular.get<CartRepository>(), controller: Modular.get<CartController>(),)),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/product', module: ProductModule()),
  ];
}