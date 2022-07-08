import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/modules/products/product_page.dart';

class ProductModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) {
          final product = args.data;
          return ProductPage(product: product);
        })
      ];
}
