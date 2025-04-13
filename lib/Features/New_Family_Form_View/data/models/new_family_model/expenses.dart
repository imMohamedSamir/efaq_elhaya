class ExpensesModel {
  double transportation;
  double electricity;
  double gas;
  double waterBill;
  double food;
  double other;
  double education;
  double rent;
  double totalExpenses;
  double netIncome;
  String? totalExpensesDescription;

  ExpensesModel({
    this.transportation = 0,
    this.electricity = 0,
    this.gas = 0,
    this.waterBill = 0,
    this.food = 0,
    this.other = 0,
    this.education = 0,
    this.rent = 0,
    this.totalExpenses = 0,
    this.netIncome = 0,
    this.totalExpensesDescription,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      transportation: json['transportation'] ?? 0,
      electricity: json['electricity'] ?? 0,
      gas: json['gas'] ?? 0,
      waterBill: json['waterBill'] ?? 0,
      food: json['food'] ?? 0,
      other: json['other'] ?? 0,
      education: json['education'] ?? 0,
      rent: json['rent'] ?? 0,
      totalExpenses: json['totalExpenses'] ?? 0,
      netIncome: json['netIncome'] ?? 0,
      totalExpensesDescription: json['totalExpensesDescribtion'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transportation': transportation,
      'electricity': electricity,
      'gas': gas,
      'waterBill': waterBill,
      'food': food,
      'other': other,
      'education': education,
      'rent': rent,
      'totalExpenses': totalExpenses,
      'netIncome': netIncome,
      'totalExpensesDescribtion': totalExpensesDescription,
    };
  }

  double calculateTotalExpenses() {
    totalExpenses = transportation +
        electricity +
        gas +
        waterBill +
        food +
        other +
        education +
        rent;
    return totalExpenses;
  }

  double? getExpenseValue(String s) {
    switch (s) {
      case 'transportation':
        return transportation;
      case 'electricity':
        return electricity;
      case 'gas':
        return gas;
      case 'waterBill':
        return waterBill;
      case 'food':
        return food;
      case 'other':
        return other;
      case 'education':
        return education;
      case 'rent':
        return rent;
      default:
        return 0;
    }
  }
}
