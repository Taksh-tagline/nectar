// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExploreHiveModelAdapter extends TypeAdapter<ExploreHiveModel> {
  @override
  final int typeId = 8;

  @override
  ExploreHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExploreHiveModel(
      color: fields[2] as String,
      image: fields[0] as String,
      title: fields[1] as String,
      listProduct: (fields[3] as List).cast<CardExploreModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExploreHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.listProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExploreHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CardExploreModelAdapter extends TypeAdapter<CardExploreModel> {
  @override
  final int typeId = 9;

  @override
  CardExploreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardExploreModel(
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
  void write(BinaryWriter writer, CardExploreModel obj) {
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
      other is CardExploreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
