class OutdatedUserPass {
  String passName;

  String userPassID;
  String passID;
  String passImageUrl;

  OutdatedUserPass.formJson(Map<String, dynamic> json) {
    this.userPassID = json['id'];
    this.passID = json['passId'];

    this.passName = json['name'];
    this.passImageUrl = json['urlImage'];
    // this.name = json['passId'];
  }
}
