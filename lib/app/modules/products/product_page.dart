import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mm_hamburgueria/app/models/product_model.dart';
import 'package:mm_hamburgueria/app/modules/products/widgets/ingredient_tile.dart';

class ProductPage extends StatelessWidget {
  final ProductModel product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        imageUrl: product.image,
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
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Wrap(
                                      children: [
                                        AutoSizeText(
                                          product.name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AutoSizeText(
                                      'R\$ ${product.price.toStringAsFixed(2)}',
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
                                    product.description,
                                    maxFontSize: 25,
                                    minFontSize: 15,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: Wrap(
                                    children: product.ingredients
                                        .map((e) => SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: IngredientTile(ingredient: e)))
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
                                      //height: MediaQuery.of(context).size.height * 0.04,
                                      //width: MediaQuery.of(context).size.width * 0.13,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 253, 240, 204),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: SizedBox(
                                          child: Image.network(
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/OOjs_UI_icon_heart.svg/1200px-OOjs_UI_icon_heart.svg.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            color:
                                                const Color.fromARGB(255, 247, 181, 0),
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
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              const Color.fromARGB(255, 247, 181, 0),
                                            ),
                                          ),
                                          child: const Text('Add to Cart'),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
