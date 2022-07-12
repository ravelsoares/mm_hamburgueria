import 'package:mm_hamburgueria/repository/cart/cart_repository.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';

class CartController {
  final CartRepository _cartRepository;
  CartController({
    required cartRepository,
  }) : _cartRepository = cartRepository;
  List<CartModel> cartList = [];

  saveProductInCart(ProductModel product) {
    final cart =
        CartModel(name: product.name, price: product.price, quantity: 1);
    cartList.add(cart);
    _cartRepository.saveProductInCart(cartList);
  }
}
