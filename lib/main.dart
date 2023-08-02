import 'package:flutter/material.dart';
import 'package:food/Orders.dart';
import 'package:food/forgotpassword.dart';
import 'package:food/home_page.dart';
import 'package:food/login.dart';
import 'package:food/models.dart';
import 'package:food/signuppage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var ordersbox="Ordersbox";


  void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(MyOrdersAdapter());
  await Hive.openBox<MyOrders>(ordersbox);

await Supabase.initialize(
    url: 'https://pbdoamgcywqybdbfrfoc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBiZG9hbWdjeXdxeWJkYmZyZm9jIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTA5Njk2MzcsImV4cCI6MjAwNjU0NTYzN30.BhUPmkUfpTl55KQ1ST5c4TRKp4GsWiNsV-E_ZIfXgms'
  );
print('Initialized_Supabase');
  runApp(const MyApp());
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LogInPage(),
        routes: {
          '/home':(context) => HomePage(),
          '/signup':(context) => const SignUpPage(),
          '/orders':(context) => const Orders(),
          '/login':(context) => const LogInPage(),
          '/forgotpassword':(context) => const ForgotPasswordPage(),
          
        },
        );
}

