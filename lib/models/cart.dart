import 'package:flutter_app/models/catalog.dart';

class CartModel {
  
  // catalog field.
  late CatalogModel catalog;

  //Collection of IDs - Stored Ids of each item.
  final List<int> _itemIds = [];

  //Get Items in the Cart.
  List<Item> get items => _itemIds.map((id) => CatalogModel.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id!);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
