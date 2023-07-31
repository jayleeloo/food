// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food/Orders.dart';
import 'package:food/main.dart';
import 'package:food/models.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _orderscontroller = TextEditingController();
   late Box<MyOrders> MyOrdersbox;

  @override
  void initState() {
    super.initState();
    MyOrdersbox = Hive.box(ordersbox);
  }
  @override
  void dispose() {
    super.dispose();
    _orderscontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 89, 128),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 39, 104),
              ),
              child: Text('Draw List'),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('SignUp'),
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text('EatHappyMenuApp'),
        centerTitle: true,
      ),
      body:
       SingleChildScrollView(
        child: Column(
          children: [
  
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: const Color.fromARGB(255, 156, 207, 246),
                width: 500,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                'assets/images/bever.jpg',
                              ),
                            ),
                            const Text('BEVERAGES'),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 238, 225, 240),
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                'assets/images/lunch.jpg',
                              ),
                            ),
                            const Text('LUNCH/FASTFOOD')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                              child: Image.asset('assets/images/Breakfast.jpg'),
                            ),
                            const Text('BREAKFAST'),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                              child: Image.asset('assets/images/dinner.jpg'),
                            ),
                            const Text('DINNER/DESSERT')
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: const Color.fromARGB(255, 155, 210, 238),
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 233, 95, 85),
                                    borderRadius: BorderRadius.circular(20)),
                                width: 150,
                                height: 150,
                                child: Image.asset('assets/images/Takeout.jpg'),
                              ),
                              const Text('TAKEOUT')
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 134, 71, 66),
                                    borderRadius: BorderRadius.circular(20)),
                                width: 150,
                                height: 150,
                              ),
                              const Text('HOMECOOKOUT')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      
    );
  }
}
