// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodAdapter extends TypeAdapter<Mood> {
  @override
  final int typeId = 0;

  @override
  Mood read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mood(
      mood: fields[0] as int,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mood obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mood)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
