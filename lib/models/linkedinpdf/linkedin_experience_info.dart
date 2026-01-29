class LinkedinExperienceInfo {
  final String organisation;
  final String position;
  final String startYear;
  final String startMonth;
  final String endYear;
  final String endMonth;
  final String location;
  final bool onGoing;
  final String description;

  LinkedinExperienceInfo(
      this.organisation,
      this.position,
      this.startYear,
      this.startMonth,
      this.endYear,
      this.endMonth,
      this.location,
      this.onGoing,
      this.description);

  @override
  String toString() {
    return "$organisation\n$position\n$startMonth $startYear - $endMonth $endYear ${onGoing ? "Present" : ""}\n$location\n\n$description\n-----------------\n";
  }
}
