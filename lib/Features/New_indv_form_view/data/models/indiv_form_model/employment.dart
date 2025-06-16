class IndivEmployment {
  bool? isEmployed;
  String? job;
  double? income;
  String? incomeSource;

  IndivEmployment(
      {this.isEmployed = false,
      this.job = "",
      this.income = 0,
      this.incomeSource});

  factory IndivEmployment.fromJson(Map<String, dynamic> json) =>
      IndivEmployment(
        isEmployed: json['isEmployed'] as bool?,
        job: json['job'] as String?,
        income: json['income'] as double?,
        incomeSource: json['incomeSource'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isEmployed': isEmployed,
        'job': job,
        'income': income,
        'incomeSource': incomeSource,
      };
}
