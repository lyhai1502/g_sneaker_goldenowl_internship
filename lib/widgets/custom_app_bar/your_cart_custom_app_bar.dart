import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

class YourCartCustomAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  YourCartCustomAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(126.0),
        super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AppBarWidgetState();
  }

  @override
  Size preferredSize;
}

class AppBarWidgetState extends State<YourCartCustomAppBarWidget> {
  YourCartShoeRepository yourCartShoeRepository = YourCartShoeRepository();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    yourCartShoeRepository = context.read<YourCartShoeRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    height: 60,
                    child: IconButton(
                      icon: Image.asset(
                        'lib/assets/nike.png',
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.home,
                        color: CustomColors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Cart',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Rubik-Bold',
                          fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Text(
                          '\$${yourCartShoeRepository.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Rubik-Bold',
                            fontWeight: FontWeight.w900,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
