import 'package:flutter/material.dart';

class ActionsAppbar extends StatelessWidget {

  const ActionsAppbar({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 49,
                    width: 49,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 251, 215, 115),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 251, 215, 115),
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 49,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 253, 240, 204),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: Color.fromARGB(255, 251, 215, 115),
                          ),
                          const Text(
                            'CART',
                            style: TextStyle(
                                color: Color.fromARGB(255, 180, 159, 104)),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 181, 0),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(child: Text('2')),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}
