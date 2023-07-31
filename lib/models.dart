import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 1)
class MyOrders {
  @HiveField(0)
  String name;

  @HiveField(1)
  int eaters;

  @HiveField(2)
  int phonenumber;

  @HiveField(3)
  String location;

  MyOrders({required this.name, required this.eaters, required this.phonenumber, required this.location});
}
 

