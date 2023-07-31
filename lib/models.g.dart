// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyOrdersAdapter extends TypeAdapter<MyOrders> {
  @override
  final int typeId = 1;

  @override
  MyOrders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyOrders(
      name: fields[0] as String,
      eaters: fields[1] as int,
      phonenumber: fields[2] as int,
      location: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyOrders obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.eaters)
      ..writeByte(2)
      ..write(obj.phonenumber)
      ..writeByte(3)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyOrdersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
