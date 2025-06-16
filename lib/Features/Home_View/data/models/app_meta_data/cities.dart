import 'package:hive/hive.dart';

part 'cities.g.dart';

@HiveType(typeId: 1)
class Cities extends HiveObject {
  @HiveField(0)
  List<String>? cairo;

  @HiveField(1)
  List<String>? alexandria;

  @HiveField(2)
  List<String>? giza;

  @HiveField(3)
  List<String>? luxor;

  @HiveField(4)
  List<String>? aswan;

  @HiveField(5)
  List<String>? sharqia;

  @HiveField(6)
  List<String>? dakahlia;

  @HiveField(7)
  List<String>? gharbia;

  @HiveField(8)
  List<String>? fayoum;

  @HiveField(9)
  List<String>? kafrElSheikh;

  @HiveField(10)
  List<String>? qena;

  @HiveField(11)
  List<String>? beheira;

  @HiveField(12)
  List<String>? ismailia;

  @HiveField(13)
  List<String>? minya;

  @HiveField(14)
  List<String>? sohag;

  @HiveField(15)
  List<String>? baniSuef;

  @HiveField(16)
  List<String>? portSaid;

  @HiveField(17)
  List<String>? suez;

  @HiveField(18)
  List<String>? redSea;

  @HiveField(19)
  List<String>? matrouh;

  @HiveField(20)
  List<String>? northSinai;

  @HiveField(21)
  List<String>? southSinai;

  @HiveField(22)
  List<String>? monufia;

  @HiveField(23)
  List<String>? newValley;

  Cities({
    this.cairo,
    this.alexandria,
    this.giza,
    this.luxor,
    this.aswan,
    this.sharqia,
    this.dakahlia,
    this.gharbia,
    this.fayoum,
    this.kafrElSheikh,
    this.qena,
    this.beheira,
    this.ismailia,
    this.minya,
    this.sohag,
    this.baniSuef,
    this.portSaid,
    this.suez,
    this.redSea,
    this.matrouh,
    this.northSinai,
    this.southSinai,
    this.monufia,
    this.newValley,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        cairo: (json['القاهرة'] as List<dynamic>?)?.cast<String>(),
        alexandria: (json['الإسكندرية'] as List<dynamic>?)?.cast<String>(),
        giza: (json['الجيزة'] as List<dynamic>?)?.cast<String>(),
        luxor: (json['الأقصر'] as List<dynamic>?)?.cast<String>(),
        aswan: (json['أسوان'] as List<dynamic>?)?.cast<String>(),
        sharqia: (json['الشرقية'] as List<dynamic>?)?.cast<String>(),
        dakahlia: (json['الدقهلية'] as List<dynamic>?)?.cast<String>(),
        gharbia: (json['الغربية'] as List<dynamic>?)?.cast<String>(),
        fayoum: (json['الفيوم'] as List<dynamic>?)?.cast<String>(),
        kafrElSheikh: (json['كفر الشيخ'] as List<dynamic>?)?.cast<String>(),
        qena: (json['قنا'] as List<dynamic>?)?.cast<String>(),
        beheira: (json['البحيرة'] as List<dynamic>?)?.cast<String>(),
        ismailia: (json['الإسماعيلية'] as List<dynamic>?)?.cast<String>(),
        minya: (json['المنيا'] as List<dynamic>?)?.cast<String>(),
        sohag: (json['سوهاج'] as List<dynamic>?)?.cast<String>(),
        baniSuef: (json['بني سويف'] as List<dynamic>?)?.cast<String>(),
        portSaid: (json['بورسعيد'] as List<dynamic>?)?.cast<String>(),
        suez: (json['السويس'] as List<dynamic>?)?.cast<String>(),
        redSea: (json['البحر الأحمر'] as List<dynamic>?)?.cast<String>(),
        matrouh: (json['مطروح'] as List<dynamic>?)?.cast<String>(),
        northSinai: (json['شمال سيناء'] as List<dynamic>?)?.cast<String>(),
        southSinai: (json['جنوب سيناء'] as List<dynamic>?)?.cast<String>(),
        monufia: (json['المنوفية'] as List<dynamic>?)?.cast<String>(),
        newValley: (json['الوادي الجديد'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'القاهرة': cairo,
        'الإسكندرية': alexandria,
        'الجيزة': giza,
        'الأقصر': luxor,
        'أسوان': aswan,
        'الشرقية': sharqia,
        'الدقهلية': dakahlia,
        'الغربية': gharbia,
        'الفيوم': fayoum,
        'كفر الشيخ': kafrElSheikh,
        'قنا': qena,
        'البحيرة': beheira,
        'الإسماعيلية': ismailia,
        'المنيا': minya,
        'سوهاج': sohag,
        'بني سويف': baniSuef,
        'بورسعيد': portSaid,
        'السويس': suez,
        'البحر الأحمر': redSea,
        'مطروح': matrouh,
        'شمال سيناء': northSinai,
        'جنوب سيناء': southSinai,
        'المنوفية': monufia,
        'الوادي الجديد': newValley,
      };

  /// **Method to Get Cities by Governorate Name**
  List<String>? getCitiesByGovernorate(String governorate) {
    Map<String, List<String>?> cityMap = {
      'القاهرة': cairo,
      'الإسكندرية': alexandria,
      'الجيزة': giza,
      'الأقصر': luxor,
      'أسوان': aswan,
      'الشرقية': sharqia,
      'الدقهلية': dakahlia,
      'الغربية': gharbia,
      'الفيوم': fayoum,
      'كفر الشيخ': kafrElSheikh,
      'قنا': qena,
      'البحيرة': beheira,
      'الإسماعيلية': ismailia,
      'المنيا': minya,
      'سوهاج': sohag,
      'بني سويف': baniSuef,
      'بورسعيد': portSaid,
      'السويس': suez,
      'البحر الأحمر': redSea,
      'مطروح': matrouh,
      'شمال سيناء': northSinai,
      'جنوب سيناء': southSinai,
      'المنوفية': monufia,
      'الوادي الجديد': newValley,
    };

    return cityMap[governorate] ?? [];
  }
}
