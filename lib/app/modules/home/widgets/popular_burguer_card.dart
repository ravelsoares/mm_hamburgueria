import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mm_hamburgueria/app/models/product_model.dart';

class PopularBurguerCard extends StatelessWidget {
  final ProductModel product;
  const PopularBurguerCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.52,
      height: MediaQuery.of(context).size.height * 0.33,
      child: Stack(children: [
        LayoutBuilder(
          builder: (context, constraints) => InkWell(
            onTap: () {
              Modular.to.pushNamed('/product', arguments: product);
            },
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                                value: progress.progress),
                          ),
                          imageUrl: product.image,
                          fit: BoxFit.cover,
                          height: constraints.maxHeight * 0.70,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.21,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.235,
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: AutoSizeText(
                                      product.name,
                                      minFontSize: 9,
                                      maxFontSize: 12,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: AutoSizeText(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                minFontSize: 9,
                                maxFontSize: 12,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
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
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.025,
          bottom: -0.3,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 247, 181, 0),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
