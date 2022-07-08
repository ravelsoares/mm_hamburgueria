import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final String ingredient;
  const IngredientTile({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) => Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 253, 240, 204),
              borderRadius: BorderRadius.circular(30)),
          margin: const EdgeInsets.only(top: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Wrap(
                    children: [
                      AutoSizeText(
                        ingredient,
                        minFontSize: 8,
                        maxFontSize: 10,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 247, 181, 0),
                  child: Center(
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
