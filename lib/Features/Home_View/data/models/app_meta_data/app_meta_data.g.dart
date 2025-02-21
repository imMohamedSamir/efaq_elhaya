// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_meta_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppMetaDataAdapter extends TypeAdapter<AppMetaData> {
  @override
  final int typeId = 0;

  @override
  AppMetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppMetaData(
      governorates: (fields[0] as List?)?.cast<String>(),
      cities: fields[1] as Cities?,
      centers: (fields[2] as List?)?.cast<String>(),
      maritalStatus: (fields[3] as List?)?.cast<String>(),
      workTitles: (fields[4] as List?)?.cast<String>(),
      educationLevels: (fields[5] as List?)?.cast<String>(),
      surveyStatus: (fields[6] as List?)?.cast<String>(),
      surveyCheckboxOptions: (fields[7] as List?)?.cast<String>(),
      furnitureTypes: (fields[8] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AppMetaData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.governorates)
      ..writeByte(1)
      ..write(obj.cities)
      ..writeByte(2)
      ..write(obj.centers)
      ..writeByte(3)
      ..write(obj.maritalStatus)
      ..writeByte(4)
      ..write(obj.workTitles)
      ..writeByte(5)
      ..write(obj.educationLevels)
      ..writeByte(6)
      ..write(obj.surveyStatus)
      ..writeByte(7)
      ..write(obj.surveyCheckboxOptions)
      ..writeByte(8)
      ..write(obj.furnitureTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppMetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
