class IndivSurveySource {
  bool? phoneSurvey = false;
  bool? fieldSurvey = false;

  IndivSurveySource({this.phoneSurvey, this.fieldSurvey});

  factory IndivSurveySource.fromJson(Map<String, dynamic> json) =>
      IndivSurveySource(
        phoneSurvey: json['phoneSurvey'] as bool?,
        fieldSurvey: json['fieldSurvey'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'phoneSurvey': phoneSurvey,
        'fieldSurvey': fieldSurvey,
      };
}
