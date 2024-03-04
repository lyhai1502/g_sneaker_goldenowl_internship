import 'package:flutter/material.dart';

class OurProductsCustomAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  OurProductsCustomAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(100.0),
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
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onPressed: () {},
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}