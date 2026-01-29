class LinkedinEducationInfo {
  final String organisation;
  final String degree;
  final String field;
  final String startYear;
  final String endYear;
  final bool onGoing;

  LinkedinEducationInfo(this.organisation, this.degree, this.field,
      this.startYear, this.endYear, this.onGoing);

  @override
  String toString() {
    return "$organisation\n$degree\n$field\n$startYear - $endYear ${onGoing ? "Present" : ""}\n-----------------\n";
  }
}
