class Medicines {
  String? name;
  String? description;
  String? imageUrl;
  String? dose;
  double? cost;

  Medicines({
    this.name,
    this.description,
    this.imageUrl,
    this.dose,
    this.cost,
  });

  factory Medicines.fromJson(Map<String, dynamic> json) => Medicines(
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
        dose: json['dose'] as String?,
        cost: json['cost'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'dose': dose,
        'cost': cost,
      };
}
