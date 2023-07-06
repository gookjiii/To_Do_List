// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriorityAdapter extends TypeAdapter<Priority> {
  @override
  final int typeId = 1;

  @override
  Priority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Priority.basic;
      case 1:
        return Priority.low;
      case 2:
        return Priority.important;
      default:
        return Priority.basic;
    }
  }

  @override
  void write(BinaryWriter writer, Priority obj) {
    switch (obj) {
      case Priority.basic:
        writer.writeByte(0);
        break;
      case Priority.low:
        writer.writeByte(1);
        break;
      case Priority.important:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
