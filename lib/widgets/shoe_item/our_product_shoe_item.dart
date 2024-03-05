import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

class OurProductsShoeItemWidget extends StatefulWidget {
  OurProductsShoeItemWidget({Key? key, required this.shoe}) : super(key: key);

  Shoe shoe;

  @override
  _OurProductsShoeItemWidgetState createState() =>
      _OurProductsShoeItemWidgetState();
}

class _OurProductsShoeItemWidgetState extends State<OurProductsShoeItemWidget> {
  @override
  Widget build(BuildContext context) {
    YourCartShoeRepository yourCartShoeRepository =
        context.watch<YourCartShoeRepository>();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(40.0), // Set the border radius
                child: Container(
                  width: double.infinity,
                  height: 500,
                  color: Color(
                      int.parse('0xFF${widget.shoe.color?.split('#').last}')),
                ),
              ),
              Transform.rotate(
                angle: -20 *
                    (3.1415926535897932 / 180), // Convert degrees to radians
                child: Image.network(widget.shoe.image ?? ''),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(widget.shoe.name ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(widget.shoe.description ?? '',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$${widget.shoe.price.toString()}',
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                !widget.shoe.isAdded!
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            yourCartShoeRepository.addShoe(widget.shoe);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(int.parse(
                                  '0xFFF6C90E'))), // Set the background color
                        ),
                        child: const Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(int.parse('0xFFF6C90E'))),
                          ),
                          IconButton(
                            icon: Image.asset(
                              'lib/assets/check.png',
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
