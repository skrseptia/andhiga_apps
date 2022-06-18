// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final String id;
  final String tittle;
  final String price;
  final String image;
  final String desc;
  Item({
    required this.id,
    required this.tittle,
    required this.price,
    required this.image,
    required this.desc,
  });

  Item copyWith({
    String? id,
    String? tittle,
    String? price,
    String? image,
    String? desc,
  }) {
    return Item(
      id: id ?? this.id,
      tittle: tittle ?? this.tittle,
      price: price ?? this.price,
      image: image ?? this.image,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'price': price,
      'image': image,
      'desc': desc,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      tittle: map['tittle'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, tittle: $tittle, price: $price, image: $image, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.tittle == tittle &&
        other.price == price &&
        other.image == image &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tittle.hashCode ^
        price.hashCode ^
        image.hashCode ^
        desc.hashCode;
  }
}
