import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/our_products_shoes_repository.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:g_sneaker/widgets/custom_app_bar/our_products_custom_app_bar.dart';
import 'package:g_sneaker/widgets/custom_app_bar/your_cart_custom_app_bar.dart';
import 'package:g_sneaker/widgets/shoe_item/our_product_shoe_item.dart';
import 'package:g_sneaker/widgets/shoe_item/your_cart_shoe_item.dart';
import 'package:provider/provider.dart';

class YourCartScreen extends StatefulWidget {
  const YourCartScreen({Key? key}) : super(key: key);

  @override
  State<YourCartScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<YourCartScreen> {
  YourCartShoeRepository yourCartShoeRepository = YourCartShoeRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    yourCartShoeRepository = context.read<YourCartShoeRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YourCartCustomAppBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (Shoe shoe in yourCartShoeRepository.yourCartShoes)
                YourCartShoeItemWidget(
                  shoe: shoe,
                )
            ],
          ),
        ));
  }
}
