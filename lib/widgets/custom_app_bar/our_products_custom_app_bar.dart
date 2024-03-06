import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';

// ignore: must_be_immutable
class OurProductsCustomAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  OurProductsCustomAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(126.0),
        super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AppBarWidgetState();
  }

  @override
  Size preferredSize;
}

class AppBarWidgetState extends State<OurProductsCustomAppBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.shopping_bag,
                color: CustomColors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/YourCart');
              },
            ),
          ),
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Our Products',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Rubik-Bold',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
