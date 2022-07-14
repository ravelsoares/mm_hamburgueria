import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../repository/cart/cart_repository.dart';
import 'package:bloc/bloc.dart';
part 'cart_state.dart';

class CartController extends Cubit<CartStatus> {
  List<CartModel> cartList = [];
  final CartRepository cartRepository;
  CartController({
    required this.cartRepository,
  }) : super(CartStatus.sucess) {
    cartRepository.getCartList().then((value) => cartList = value);
  }

  Future<void> saveProductInCart(ProductModel product) async {
    emit(CartStatus.loading);
    final cart =
        CartModel(name: product.name, price: product.price, quantity: 1);
    cartList.add(cart);
    await cartRepository.saveProductInCart(cartList);
    emit(CartStatus.sucess);
  }

  Future<List<CartModel>> getCartList() async {
    emit(CartStatus.loading);
    cartList = await cartRepository.getCartList();
    emit(CartStatus.sucess);
    return cartList;
  }
}
