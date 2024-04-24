// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groceries_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceriesHiveModelAdapter extends TypeAdapter<GroceriesHiveModel> {
  @override
  final int typeId = 7;

  @override
  GroceriesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceriesHiveModel(
      image: fields[0] as String,
      title: fields[1] as String,
      color: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GroceriesHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceriesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
