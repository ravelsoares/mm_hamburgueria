import 'dart:convert';

import '../../repository/cart/cart_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  late SharedPreferences sharedPreferences;
  @override
  void deleteProductInCart() {}

  @override
  Future<void> saveProductInCart(List<CartModel> cartList) async {
    final jsonString = json.encode(cartList);
    sharedPreferences.setString('list_cart', jsonString);
  }

  @override
  Future<List<CartModel>> getCartList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString('list_cart') ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => CartModel.fromJson(e)).toList();
  }
}
