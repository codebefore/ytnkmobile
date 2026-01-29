class LinkedinLanguageInfo {
  final String language;
  final String degree;

  LinkedinLanguageInfo(this.language, this.degree);

  @override
  String toString() {
    return "$language - ($degree)";
  }
}
