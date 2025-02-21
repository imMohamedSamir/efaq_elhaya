// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CitiesAdapter extends TypeAdapter<Cities> {
  @override
  final int typeId = 1;

  @override
  Cities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cities(
      cairo: (fields[0] as List?)?.cast<String>(),
      alexandria: (fields[1] as List?)?.cast<String>(),
      giza: (fields[2] as List?)?.cast<String>(),
      luxor: (fields[3] as List?)?.cast<String>(),
      aswan: (fields[4] as List?)?.cast<String>(),
      sharqia: (fields[5] as List?)?.cast<String>(),
      dakahlia: (fields[6] as List?)?.cast<String>(),
      gharbia: (fields[7] as List?)?.cast<String>(),
      fayoum: (fields[8] as List?)?.cast<String>(),
      kafrElSheikh: (fields[9] as List?)?.cast<String>(),
      qena: (fields[10] as List?)?.cast<String>(),
      beheira: (fields[11] as List?)?.cast<String>(),
      ismailia: (fields[12] as List?)?.cast<String>(),
      minya: (fields[13] as List?)?.cast<String>(),
      sohag: (fields[14] as List?)?.cast<String>(),
      baniSuef: (fields[15] as List?)?.cast<String>(),
      portSaid: (fields[16] as List?)?.cast<String>(),
      suez: (fields[17] as List?)?.cast<String>(),
      redSea: (fields[18] as List?)?.cast<String>(),
      matrouh: (fields[19] as List?)?.cast<String>(),
      northSinai: (fields[20] as List?)?.cast<String>(),
      southSinai: (fields[21] as List?)?.cast<String>(),
      monufia: (fields[22] as List?)?.cast<String>(),
      newValley: (fields[23] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Cities obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.cairo)
      ..writeByte(1)
      ..write(obj.alexandria)
      ..writeByte(2)
      ..write(obj.giza)
      ..writeByte(3)
      ..write(obj.luxor)
      ..writeByte(4)
      ..write(obj.aswan)
      ..writeByte(5)
      ..write(obj.sharqia)
      ..writeByte(6)
      ..write(obj.dakahlia)
      ..writeByte(7)
      ..write(obj.gharbia)
      ..writeByte(8)
      ..write(obj.fayoum)
      ..writeByte(9)
      ..write(obj.kafrElSheikh)
      ..writeByte(10)
      ..write(obj.qena)
      ..writeByte(11)
      ..write(obj.beheira)
      ..writeByte(12)
      ..write(obj.ismailia)
      ..writeByte(13)
      ..write(obj.minya)
      ..writeByte(14)
      ..write(obj.sohag)
      ..writeByte(15)
      ..write(obj.baniSuef)
      ..writeByte(16)
      ..write(obj.portSaid)
      ..writeByte(17)
      ..write(obj.suez)
      ..writeByte(18)
      ..write(obj.redSea)
      ..writeByte(19)
      ..write(obj.matrouh)
      ..writeByte(20)
      ..write(obj.northSinai)
      ..writeByte(21)
      ..write(obj.southSinai)
      ..writeByte(22)
      ..write(obj.monufia)
      ..writeByte(23)
      ..write(obj.newValley);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
