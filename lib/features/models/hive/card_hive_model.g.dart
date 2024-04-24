// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardHiveModelAdapter extends TypeAdapter<CardHiveModel> {
  @override
  final int typeId = 0;

  @override
  CardHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardHiveModel(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      image: (fields[3] as List).cast<dynamic>(),
      price: fields[2] as String,
      productDetails: fields[6] as String,
      nutrition: fields[7] as NutritionHiveModel,
      quantity: fields[5] as int,
      isFavourite: fields[4] as bool,
      review: fields[8] as int,
      isAlreadyInBasket: fields[9] as bool,
      productId: fields[10] as String,
      category: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.isFavourite)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.productDetails)
      ..writeByte(7)
      ..write(obj.nutrition)
      ..writeByte(8)
      ..write(obj.review)
      ..writeByte(9)
      ..write(obj.isAlreadyInBasket)
      ..writeByte(10)
      ..write(obj.productId)
      ..writeByte(11)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutritionHiveModelAdapter extends TypeAdapter<NutritionHiveModel> {
  @override
  final int typeId = 1;

  @override
  NutritionHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NutritionHiveModel(
      calories: fields[0] as String,
      vitamin: fields[1] as String,
      fibar: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NutritionHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.vitamin)
      ..writeByte(2)
      ..write(obj.fibar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
