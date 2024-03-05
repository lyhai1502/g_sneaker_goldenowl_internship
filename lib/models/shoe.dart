class Shoe {
  int? _id;
  String? _image;
  String? _name;
  String? _description;
  double? _price;
  String? _color;
  bool? _isAdded = false;

  Shoe(
      {int? id,
      String? image,
      String? name,
      String? description,
      double? price,
      String? color,
      bool? isAdded}) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (price != null) {
      _price = price;
    }
    if (color != null) {
      _color = color;
    }
    if (isAdded != null) {
      _isAdded = isAdded;
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
  bool? get isAdded => _isAdded;
  set isAdded(bool? isAdded) => _isAdded = isAdded;

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
    data['id'] = _id;
    data['image'] = _image;
    data['name'] = _name;
    data['description'] = _description;
    data['price'] = _price;
    data['color'] = _color;
    return data;
  }
}
