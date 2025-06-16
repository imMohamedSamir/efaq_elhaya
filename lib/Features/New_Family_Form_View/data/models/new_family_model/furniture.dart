class Furniture {
  String? homeDescription;
  int? numberOfRooms;
  String? houseCondition;
  String? furnitureDescription;
  Map<String, bool>? booleanFurnitureItems;
  Map<String, int>? numericFurnitureItems;

  Furniture({
    this.homeDescription,
    this.numberOfRooms,
    this.houseCondition,
    this.furnitureDescription,
    this.booleanFurnitureItems,
    this.numericFurnitureItems,
  }) {
    booleanFurnitureItems ??= {};
    numericFurnitureItems ??= {};
  }

  /// ✅ Factory constructor to create Furniture from JSON
  factory Furniture.fromJson(Map<String, dynamic> json) => Furniture(
        homeDescription: json['homeDescription'] as String?,
        numberOfRooms: json['numberOfRooms'] as int?,
        houseCondition: json['houseCondition'] as String?,
        furnitureDescription: json['furnitureDescription'] as String?,
        booleanFurnitureItems: json['booleanFurnitureItems'] != null
            ? Map<String, bool>.from(json['booleanFurnitureItems'])
            : null,
        numericFurnitureItems: json['numericFurnitureItems'] != null
            ? Map<String, int>.from(json['numericFurnitureItems'])
            : null,
      );

  /// ✅ Convert Furniture to JSON
  Map<String, dynamic> toJson() => {
        'homeDescription': homeDescription,
        'numberOfRooms': numberOfRooms,
        'houseCondition': houseCondition,
        'furnitureDescription': furnitureDescription,
        'booleanFurnitureItems': booleanFurnitureItems,
        'numericFurnitureItems': numericFurnitureItems,
      };
}
