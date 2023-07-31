import 'package:flutter/material.dart';
import 'package:food/Orders.dart';
import 'package:food/home_page.dart';
import 'package:food/models.dart';
import 'package:food/signuppage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

var ordersbox="Ordersbox";


  void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(MyOrdersAdapter());
  await Hive.openBox<MyOrders>(ordersbox);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/home':(context) => HomePage(),
          '/signup':(context) => SignUpPage(),
          '/orders':(context) => Orders(),
          
        },
        );
}

