import 'package:flutter_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  
  CartModel._internal();
  
  factory CartModel() => cartModel;
  
  // catalog field.
  late CatalogModel _catalog;

  //Collection of IDs - Stored Ids of each item.
  final List<int> _itemIds = [];

  //Get Catalog.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

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
