import 'package:flutter/material.dart';
import 'package:g_sneaker/constants/custom_colors.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class YourCartShoeItemWidget extends StatefulWidget {
  YourCartShoeItemWidget(
      {Key? key,
      required this.callback,
      required this.number,
      required this.shoe})
      : super(key: key);

  Function callback;
  int number;
  Shoe shoe;

  @override
  State<StatefulWidget> createState() {
    return YourCartShoeItemWidgetState();
  }
}

class YourCartShoeItemWidgetState extends State<YourCartShoeItemWidget> {
  @override
  Widget build(BuildContext context) {
    YourCartShoeRepository yourCartShoeRepository =
        context.watch<YourCartShoeRepository>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 170,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(int.parse(
                            '0xFF${widget.shoe.color?.split('#').last}'))),
                  ),
                ),
                Transform.rotate(
                  angle: -15 *
                      (3.1415926535897932 / 180), // Convert degrees to radians
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(widget.shoe.image ?? '')),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.shoe.name ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Rubik-Bold',
                      fontWeight: FontWeight.w800,
                    )),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text('\$${widget.shoe.price?.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik-Bold',
                      fontWeight: FontWeight.w900,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grayLight),
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    'lib/assets/minus.png',
                                    width: 10,
                                    height: 10,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      yourCartShoeRepository
                                          .minusShoe(widget.shoe);
                                    });
                                    widget.callback();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(widget.number.toString(),
                              style: const TextStyle(fontSize: 15)),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.grayLight),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'lib/assets/plus.png',
                                width: 10,
                                height: 10,
                              ),
                              onPressed: () {
                                setState(() {
                                  yourCartShoeRepository.addShoe(widget.shoe);
                                });
                                widget.callback();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.yellow),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'lib/assets/trash.png',
                            width: 18,
                            height: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              yourCartShoeRepository.removeShoe(widget.shoe);
                            });
                            widget.callback();
                          },
                        ),
                      ],
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
