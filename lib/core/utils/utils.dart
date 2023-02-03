class Utils {
  static DateTime strToDateConverter(String str) {
    const Map<int, String> monthsInYear = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Oct",
      11: "Nov",
      12: "Dec"
    };

    int year = int.parse(str.substring(7, 11));

    int month = monthsInYear.entries
        .firstWhere((element) => element.value == str.substring(3, 6))
        .key;

    int day = int.parse(str.substring(0, 2));

    return DateTime(year, month, day);
  }
}
