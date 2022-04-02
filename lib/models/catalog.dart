import 'dart:convert';

class CatalogModel {
  static List<Item> items = [
    // Item(
    //     id: 1,
    //     title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    //     price: 109.95,
    //     description:
    //         "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    //     category: "men's clothing",
    //     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
  ];
}

class Item {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Item({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image
  });

  Item copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(title != null){
      result.addAll({'title': title});
    }
    if(price != null){
      result.addAll({'price': price});
    }
    if(description != null){
      result.addAll({'description': description});
    }
    if(category != null){
      result.addAll({'category': category});
    }
    if(image != null){
      result.addAll({'image': image});
    }
  
    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt(),
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.title == title &&
      other.price == price &&
      other.description == description &&
      other.category == category &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode;
  }
}
