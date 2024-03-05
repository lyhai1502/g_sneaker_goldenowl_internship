import 'package:flutter/material.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

class YourCartCustomAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  YourCartCustomAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(100.0),
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
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.home,
                        color: Colors.black,
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
                      'Your Cart:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('\$${yourCartShoeRepository.totalPrice}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
