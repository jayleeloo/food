import 'package:flutter/material.dart';
import 'package:food/main.dart';
import 'package:food/models.dart';
import 'package:hive_flutter/adapters.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final TextEditingController _myorderscontroller = TextEditingController();
  final TextEditingController _eaterscontroller = TextEditingController();
  final TextEditingController _phonenumbercontroller = TextEditingController();
  final TextEditingController _locationcontroller = TextEditingController();

  late Box<MyOrders> myOrdersbox;

  @override
  void initState() {
    super.initState();
    myOrdersbox = Hive.box(ordersbox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 165, 128, 140),
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
        title: Text('ORDERS'),
        shadowColor: const Color.fromARGB(255, 59, 52, 52),
      ),
body: ValueListenableBuilder(
  valueListenable: myOrdersbox.listenable(),
  builder: (context, Box<MyOrders> _myOrdersBox, _) { // Rename myOrdersbox to _myOrdersBox
    return ListView.builder(
      itemCount: _myOrdersBox.length,
      itemBuilder: (context, index) {
        List<MyOrders> records = _myOrdersBox.values.toList();
        MyOrders orderslist = records[index];
        return ListTile(
          title: Text(
              'Name=${orderslist.name} Eaters=${orderslist.eaters} Phonenumber=${orderslist.phonenumber} Location=${orderslist.location}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _myOrdersBox.deleteAt(index);
            },
          ),
        );
      },
    );
  },
),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Orders'),
                content: Column(
                  children: [
                    TextField(
                      controller: _myorderscontroller,
                      decoration: InputDecoration(hintText: "List Munchies"),
                    ),
                    TextField(
                      controller: _eaterscontroller,
                      decoration: InputDecoration(hintText: "Number of Eaters"),
                    ),
                    TextField(
                      controller: _phonenumbercontroller,
                      decoration: InputDecoration(hintText: "Phone number"),
                    ),
                    TextField(
                      controller: _locationcontroller,
                      decoration: InputDecoration(hintText: "Location"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      child: Text('Purchase'),
                      onPressed: () {
                        myOrdersbox.add(MyOrders(
                            name: _myorderscontroller.text,
                            eaters: int.parse(_eaterscontroller.text),
                            phonenumber: int.parse(_phonenumbercontroller.text),
                            location: _locationcontroller.text));
                        _eaterscontroller.clear();
                        _phonenumbercontroller.clear();
                        _myorderscontroller.clear();
                        _locationcontroller.clear();
                      })
                ],
              );
            }),
        elevation: 30.0,
        icon: const Icon(Icons.shopping_basket),
        label: const Text('FoodCart'),
      ),
    );
  }
}
