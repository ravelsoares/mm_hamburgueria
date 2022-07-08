import 'package:flutter/material.dart';
import 'package:mm_hamburgueria/app/core/constants.dart';
import 'package:mm_hamburgueria/app/models/product_model.dart';
import 'package:mm_hamburgueria/app/modules/home/widgets/actions_appbar.dart';
import 'package:mm_hamburgueria/app/modules/home/widgets/popular_burguer_card.dart';
import 'package:mm_hamburgueria/app/modules/home/widgets/special_burguer_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List specialProducts = Constants.specialProducts;
  List popularBurguers = Constants.popularBurguers;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const Drawer(),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              child: Image.asset('assets/image/align-left.png'),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
          ),
          actions: const [ActionsAppbar()],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Todays',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Specials',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: specialProducts.length,
                    itemBuilder: (context, index) {
                      final product = ProductModel(
                          name: specialProducts[index]['name'],
                          description: specialProducts[index]['description'],
                          price: specialProducts[index]['price'],
                          image: specialProducts[index]['image'],
                          ingredients: specialProducts[index]['ingredients'],
                        );
                      return SpecialBurguerCard(product: product);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Popular Burguers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: popularBurguers.length,
                      itemBuilder: (context, index) {
                        final product = ProductModel(
                          name: popularBurguers[index]['name'],
                          description: popularBurguers[index]['description'],
                          price: popularBurguers[index]['price'],
                          image: popularBurguers[index]['image'],
                          ingredients: popularBurguers[index]['ingredients'],
                        );
                        return PopularBurguerCard(product: product);
                      }),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
