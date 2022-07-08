import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/home/home_page.dart';
import 'package:mm_hamburgueria/app/modules/products/product_module.dart';

class AppModule extends Module{
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ModuleRoute('/product', module: ProductModule()),
  ];
}