class ExploreSurat {
  int? id;
  String? name;
  String? image;
  String? data;

  ExploreSurat({this.id, this.name, this.image, this.data});

  ExploreSurat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['data'] = this.data;
    return data;
  }
}
