class IndivSurveySource {
  bool? phoneSurvey;
  bool? fieldSurvey;

  IndivSurveySource({this.phoneSurvey = false, this.fieldSurvey = false});

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
