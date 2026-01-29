enum QuestionTypes {
  multiChoices(1, "Multi Choices", "multiChoices"),
  singleChoice(2, "Single Choice", "singleChoice"),
  dependentPercentage(3, "Dependent Percentage", "dependentPercentage"),
  dragSelection(4, "Drag Selection", "dragSelection");

  final int value;
  final String description;
  final String jsonCode;

  const QuestionTypes(this.value, this.description, this.jsonCode);

  static QuestionTypes fromDescription(String description) {
    return QuestionTypes.values
        .firstWhere((element) => element.description == description);
  }

  static QuestionTypes fromValue(int value) {
    return QuestionTypes.values.firstWhere((element) => element.value == value);
  }

  static QuestionTypes fromJsonCode(String jsonCode) {
    return QuestionTypes.values
        .firstWhere((element) => element.jsonCode == jsonCode);
  }
}
