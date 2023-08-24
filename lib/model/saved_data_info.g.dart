// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_data_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedDataInfoAdapter extends TypeAdapter<SavedDataInfo> {
  @override
  final int typeId = 0;

  @override
  SavedDataInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedDataInfo(
      name: fields[11] as String,
      list: (fields[12] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SavedDataInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedDataInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
