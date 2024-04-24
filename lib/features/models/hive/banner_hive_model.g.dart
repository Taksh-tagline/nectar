// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerHiveModelAdapter extends TypeAdapter<BannerHiveModel> {
  @override
  final int typeId = 6;

  @override
  BannerHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerHiveModel(
      title: fields[0] as String,
      subTitle: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BannerHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
