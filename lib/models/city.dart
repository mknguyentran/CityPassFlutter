class City {
  String name;

  City(name);

  City.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'name': this.name
  };
}
