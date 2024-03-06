import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:g_sneaker/widgets/custom_app_bar/your_cart_custom_app_bar.dart';
import 'package:g_sneaker/widgets/shoe_item/your_cart_shoe_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    getSavedData();
  }

  void getData() {
    yourCartShoeRepository = context.read<YourCartShoeRepository>();
  }

  void getSavedData() async {
    yourCartShoeRepository.clearShoes();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach((key) {
      Future future = Shoe.fromJsonList();
      future.then((value) {
        value.forEach((shoe) {
          if (shoe.id.toString() == key) {
            setState(() {
              shoe.isAdded = true;
              yourCartShoeRepository.yourCartShoes[shoe] = prefs.getInt(key)!;
            });
          }
        });
      });
    });
    setState(() {});
  }

  callback() {
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
                shape: BoxShape.circle, color: CustomColors.yellow)),
      ),
      Scaffold(
          appBar: YourCartCustomAppBarWidget(),
          body: yourCartShoeRepository.yourCartShoes.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var shoe
                          in yourCartShoeRepository.yourCartShoes.entries)
                        YourCartShoeItemWidget(
                            callback: callback,
                            number: shoe.value,
                            shoe: shoe.key)
                    ],
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Text(
                    'Your cart is empty.',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
    ]);
  }
}
