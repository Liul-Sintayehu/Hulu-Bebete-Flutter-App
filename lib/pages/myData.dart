class MyDataObject {
  String senderName;
  String info;
  List<Map<String, dynamic>> teteri;
  String gps;
  MyDataObject(
      {required this.gps,required this.senderName, required this.info, required this.teteri});
  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'info': info,
      'teteri': teteri.map((item) => item).toList(),
    };
  }
}
