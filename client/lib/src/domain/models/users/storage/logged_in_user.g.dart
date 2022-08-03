// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoggedInUserAdapter extends TypeAdapter<LoggedInUser> {
  @override
  final int typeId = 0;

  @override
  LoggedInUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedInUser(
      displayName: fields[0] as String,
      token: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoggedInUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedInUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
