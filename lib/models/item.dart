// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final String? tittle;
  final String? price;
  final String? image;
  final String? desc;
 
  Item({
    this.tittle,
    this.price,
    this.image,
    this.desc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tittle': tittle,
      'price': price,
      'image': image,
      'desc': desc,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      tittle: map['tittle'] != null ? map['tittle'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(tittle: $tittle, price: $price, image: $image, desc: $desc)';
  }

  Item copyWith({
    String? tittle,
    String? price,
    String? image,
    String? desc,
  }) {
    return Item(
      tittle: tittle ?? this.tittle,
      price: price ?? this.price,
      image: image ?? this.image,
      desc: desc ?? this.desc,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.tittle == tittle &&
        other.price == price &&
        other.image == image &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return tittle.hashCode ^ price.hashCode ^ image.hashCode ^ desc.hashCode;
  }
}
