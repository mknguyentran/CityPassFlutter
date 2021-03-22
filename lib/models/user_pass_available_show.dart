class AvailableUserPass {
  String name;
  DateTime expiredDate;
  String userPassID;
  String passID;
  String passImageUrl;

  AvailableUserPass.formJson(Map<String, dynamic> json) {
    this.userPassID = json['id'];
    this.passID = json['passId'];
    this.expiredDate = DateTime.parse(json['willExpireAt']);
    // this.name = json['passId'];
  }
}
