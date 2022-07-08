import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/models/product_model.dart';

class SpecialBurguerCard extends StatelessWidget {
  final ProductModel product;
  const SpecialBurguerCard(
      {Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        onTap: () {
          Modular.to.pushNamed('/product', arguments: product);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 8),
          width: MediaQuery.of(context).size.width * 0.65,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(45)),
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                                value: progress.progress),
                          ),
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      height: 150,
                      width: 170,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 15,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: Wrap(children: [
                      AutoSizeText(
                        product.name,
                        minFontSize: 12,
                        maxFontSize: 16,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 15,
                  child: AutoSizeText(
                    'R\$ ${product.price.toStringAsFixed(2)}',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
