import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';

class ShoeItemOurProductsWidget extends StatelessWidget {
  ShoeItemOurProductsWidget({Key? key, required this.shoe}) : super(key: key);

  Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(shoe.image ?? ''),
            ],
          ),
          Text(shoe.name ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(shoe.price.toString()),
              ElevatedButton(onPressed: () {}, child: Text('Add to cart'))
            ],
          ),
        ],
      ),
    );
  }
}
