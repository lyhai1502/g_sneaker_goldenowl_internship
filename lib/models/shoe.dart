class Shoe {
  int? _id;
  String? _image;
  String? _name;
  String? _description;
  double? _price;
  String? _color;

  Shoe(
      {int? id,
      String? image,
      String? name,
      String? description,
      double? price,
      String? color}) {
    if (id != null) {
      this._id = id;
    }
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (color != null) {
      this._color = color;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  double? get price => _price;
  set price(double? price) => _price = price;
  String? get color => _color;
  set color(String? color) => _color = color;

  Shoe.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    data['name'] = this._name;
    data['description'] = this._description;
    data['price'] = this._price;
    data['color'] = this._color;
    return data;
  }
}
