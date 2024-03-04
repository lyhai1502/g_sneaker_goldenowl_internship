import 'package:flutter/material.dart';
import 'package:g_sneaker/widgets/custom_app_bar/our_products_custom_app_bar.dart';
import 'package:g_sneaker/widgets/shoe_item_our_products.dart';

class OurProductsScreen extends StatefulWidget {
  const OurProductsScreen({Key? key}) : super(key: key);

  @override
  State<OurProductsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OurProductsScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: OurProductsCustomAppBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ShoeItemOurProductsWidget()
            ],
          ),
        ));
  }
}
