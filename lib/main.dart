import 'package:flutter/material.dart';
import 'package:g_sneaker/repositories/your_cart_shoes_repository.dart';
import 'package:g_sneaker/screens/our_products_screen.dart';
import 'package:g_sneaker/screens/your_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => YourCartShoeRepository()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Rubik',
          scaffoldBackgroundColor: Colors.transparent,
        ),
        routes: {
          '/OurProducts': (context) => const OurProductsScreen(),
          '/YourCart': (context) => const YourCartScreen()
        },
        home: const OurProductsScreen(),
      ),
    );
  }
}
