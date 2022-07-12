import 'package:mm_hamburgueria/app/models/cart_model.dart';

abstract class CartRepository {
  void saveProductInCart(List<CartModel> cartList);
  void deleteProductInCart();
  Future<List<CartModel>> getCartList();
}
