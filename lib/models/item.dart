// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  String? desc;
  int? id;
  String? image;
  String? name;
  double? price;
  Item({
    this.desc,
    this.id,
    this.image,
    this.name,
    this.price,
  });

  Item copyWith({
    String? desc,
    int? id,
    String? image,
    String? name,
    double? price,
  }) {
    return Item(
      desc: desc ?? this.desc,
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desc': desc,
      'id': id,
      'image': image,
      'name': name,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      desc: map['desc'] != null ? map['desc'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(desc: $desc, id: $id, image: $image, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.desc == desc &&
        other.id == id &&
        other.image == image &&
        other.name == name &&
        other.price == price;
  }

  @override
  int get hashCode {
    return desc.hashCode ^
        id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        price.hashCode;
  }
}
