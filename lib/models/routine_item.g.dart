// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoutineItemAdapter extends TypeAdapter<RoutineItem> {
  @override
  final int typeId = 3;

  @override
  RoutineItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoutineItem(
      item: fields[0] as String,
      isCompleted: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RoutineItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutineItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
