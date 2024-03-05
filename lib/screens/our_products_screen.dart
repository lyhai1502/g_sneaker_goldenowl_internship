import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/our_products_shoes_repository.dart';
import 'package:g_sneaker/widgets/custom_app_bar/our_products_custom_app_bar.dart';
import 'package:g_sneaker/widgets/shoe_item/our_product_shoe_item.dart';

class OurProductsScreen extends StatefulWidget {
  const OurProductsScreen({Key? key}) : super(key: key);

  @override
  State<OurProductsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OurProductsScreen> {
  OurProductsShoeRepository ourProductsShoeRepository =
      OurProductsShoeRepository();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    await ourProductsShoeRepository.readJson();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: CustomColors.white,
      ),
      Positioned(
          top: -80,
          left: -150,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: CustomColors.yellow),
          )),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: OurProductsCustomAppBarWidget(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (Shoe shoe in ourProductsShoeRepository.ourProductsShoes)
                  OurProductsShoeItemWidget(
                    shoe: shoe,
                  )
              ],
            ),
          )),
    ]);
  }
}
