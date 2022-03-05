import 'package:flutter/material.dart';
import 'package:rakibuddin560p/config/themes/colors.dart';
import 'package:rakibuddin560p/features/model/products_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  // final ValueChanged<Product> onSelected;
  const ProductCard(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        //  padding: EdgeInsets.only(left: 20, right: 10),
        height: 300,
        // width: 200,
        decoration: const BoxDecoration(
          color: ConstandColor.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
                left: 4,
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 140, 227, 228),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '30%',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )),
            Positioned(
              top: 30,
              child: Image.network(
                product.image!,
                height: 120,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Text(
                product.title!,
                softWrap: true,
                // textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  child: Row(children: [
                    Text(
                      '\$ ${product.price.toString()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          product.rating!.rate.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    )
                  ]),
                ))
          ],
        ));
  }
}
