import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
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
      body: SingleChildScrollView(
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
                                  color: const Color.fromARGB(255, 238, 225, 240),
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                               child: Image.asset('assets/images/lunch.jpg',),
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
                              child: Image.asset(
                                  'assets/images/Breakfast.jpg'),
                            ),
                            const Text('BREAKFAST'),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 150,
                              child:
                                  Image.asset('assets/images/dinner.jpg'),
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
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 233, 95, 85),
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                width: 150,
                                height: 150,
                                child:
                                  Image.asset('assets/images/Takeout.jpg'),
                              ),
                              const Text('TAKEOUT')
                            ],
                          ),
                          Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 134, 71, 66),
                                    borderRadius:
                                        BorderRadius.circular(20)),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        elevation: 30.0,
        icon: const Icon(Icons.shopping_basket),
        label: const Text('FoodCart'),
      ),
    );
  }
}
