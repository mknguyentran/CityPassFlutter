class AvailableUserPass {
  String passName;
  DateTime expiredDate;
  String userPassID;
  String passID;
  String passImageUrl;


  AvailableUserPass.formJson(Map<String, dynamic> json) {
    this.userPassID = json['id'];
    this.passID = json['pass']['id'];
    this.expiredDate = DateTime.parse(json['willExpireAt']);
    expiredDate = expiredDate.add(Duration(hours: 7));
    this.passName = json['pass']['name'];
    this.passImageUrl = json['pass']['urlImage'];
    // this.name = json['passId'];
  }
}
