// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemCart {
  int? id;
  String itemId;
  String qty;
  String subtotal;
  ItemCart({
    this.id,
    required this.itemId,
    required this.qty,
    required this.subtotal,
  });

  ItemCart copyWith({
    int? id,
    String? itemId,
    String? qty,
    String? subtotal,
  }) {
    return ItemCart(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      qty: qty ?? this.qty,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'itemId': itemId,
      'qty': qty,
      'subtotal': subtotal,
    };
  }

  factory ItemCart.fromMap(Map<String, dynamic> map) {
    return ItemCart(
      id: map['id'] != null ? map['id'] as int : null,
      itemId: map['itemId'] as String,
      qty: map['qty'] as String,
      subtotal: map['subtotal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCart.fromJson(String source) =>
      ItemCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemCart(id: $id, itemId: $itemId, qty: $qty, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemCart &&
        other.id == id &&
        other.itemId == itemId &&
        other.qty == qty &&
        other.subtotal == subtotal;
  }

  @override
  int get hashCode {
    return id.hashCode ^ itemId.hashCode ^ qty.hashCode ^ subtotal.hashCode;
  }
}
