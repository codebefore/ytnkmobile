class Helpers {
  static List<String> toListString(List<dynamic> map) {
    var newList = List<String>.empty(growable: true);

    for (var element in map) {
      newList.add(element as String);
    }

    return newList;
  }
}
