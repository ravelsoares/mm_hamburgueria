import 'package:asuka/asuka.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_hamburgueria/app/models/product_model.dart';
import 'package:mm_hamburgueria/app/modules/products/controller/cart_controller.dart';
import 'package:mm_hamburgueria/app/modules/products/widgets/ingredient_tile.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  final CartController controller;
  const ProductPage({Key? key, required this.product, required this.controller})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartController, CartStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case CartStatus.sucess:
            return AsukaSnackbar.success('Adicionado ao carrinho com sucesso').show();
          default:
            break;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                                value: progress.progress),
                          ),
                          imageUrl: widget.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.025,
                        left: MediaQuery.of(context).size.height * 0.01,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(247, 181, 0, 0.3),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 17.0, right: 20, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Wrap(
                                        children: [
                                          AutoSizeText(
                                            widget.product.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AutoSizeText(
                                        'R\$ ${widget.product.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  child: Wrap(children: [
                                    AutoSizeText(
                                      widget.product.description,
                                      maxFontSize: 25,
                                      minFontSize: 15,
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Wrap(
                                      children: widget.product.ingredients
                                          .map((e) => SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: IngredientTile(
                                                  ingredient: e)))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 253, 240, 204),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: SizedBox(
                                            child: IconButton(
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    isFavorite = !isFavorite;
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: const Color.fromARGB(
                                                    255, 247, 181, 0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          //height: MediaQuery.of(context).size.height * 0.04,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              widget.controller
                                                  .saveProductInCart(
                                                      widget.product);
                                            },
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 247, 181, 0),
                                              ),
                                            ),
                                            child: const Text('Add to Cart'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
