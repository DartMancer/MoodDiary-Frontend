// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodNoteAdapter extends TypeAdapter<MoodNote> {
  @override
  final int typeId = 0;

  @override
  MoodNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodNote(
      mainEmotion: fields[0] as int,
      emotionDetails: (fields[1] as List).cast<int>(),
      stressLevel: fields[2] as double,
      selfAssessment: fields[3] as double,
      dayNote: fields[4] as String,
      currentDate: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MoodNote obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mainEmotion)
      ..writeByte(1)
      ..write(obj.emotionDetails)
      ..writeByte(2)
      ..write(obj.stressLevel)
      ..writeByte(3)
      ..write(obj.selfAssessment)
      ..writeByte(4)
      ..write(obj.dayNote)
      ..writeByte(5)
      ..write(obj.currentDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
