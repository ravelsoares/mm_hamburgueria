import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/home/home_page.dart';
import 'package:mm_hamburgueria/app/modules/products/controller/cart_controller.dart';
import 'package:mm_hamburgueria/app/modules/products/product_module.dart';
import 'package:mm_hamburgueria/repository/cart/cart_repository.dart';
import 'package:mm_hamburgueria/repository/cart/cart_repository_impl.dart';

class AppModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<CartRepository>((i) => CartRepositoryImpl()),
    Bind.lazySingleton<CartController>((i) => CartController(cartRepository: i()))
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage(cartController: Modular.get(), cartRepository: Modular.get(),)),
    ModuleRoute('/product', module: ProductModule()),
  ];
}