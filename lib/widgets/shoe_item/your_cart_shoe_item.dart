import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

class YourCartShoeItemWidget extends StatelessWidget {
  YourCartShoeItemWidget({Key? key, required this.shoe}) : super(key: key);

  Shoe shoe;

  @override
  Widget build(BuildContext context) {
    YourCartShoeRepository yourCartShoeRepository =
        context.watch<YourCartShoeRepository>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(shoe.image ?? '')),
            ],
          ),
          Column(
            children: [
              Text(shoe.name ?? ''),
              Text(shoe.price.toString()),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  Text('1'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      yourCartShoeRepository.removeShoe(shoe);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
