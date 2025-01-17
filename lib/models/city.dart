class City {
  int id;
  String name;

  City(this.name, {this.id});

  City.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': this.name
  };
}
