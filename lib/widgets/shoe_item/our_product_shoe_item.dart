import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OurProductsShoeItemWidget extends StatefulWidget {
  OurProductsShoeItemWidget({Key? key, required this.shoe}) : super(key: key);

  Shoe shoe;

  @override
  // ignore: library_private_types_in_public_api
  _OurProductsShoeItemWidgetState createState() =>
      _OurProductsShoeItemWidgetState();
}

class _OurProductsShoeItemWidgetState extends State<OurProductsShoeItemWidget> {
  void saveShoe(YourCartShoeRepository yourCartShoeRepository) async {}

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
            alignment: Alignment.center,
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
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rubik-Bold',
                  fontWeight: FontWeight.w900,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(widget.shoe.description ?? '',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: CustomColors.gray)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$${widget.shoe.price?.toStringAsFixed(2).toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Rubik-Bold',
                      fontWeight: FontWeight.w900,
                    )),
                !widget.shoe.isAdded!
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            yourCartShoeRepository.addShoe(widget.shoe);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.yellow), // Set the background color
                        ),
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Rubik-Bold',
                              fontWeight: FontWeight.w900,
                              color: CustomColors.black),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.yellow),
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
