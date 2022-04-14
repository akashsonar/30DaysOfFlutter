import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field.
  late CatalogModel catalog;

  //Collection of IDs - Stored Ids of each item.
  final List<int> _itemIds = [];

  //Get Items in the Cart.
  List<Item> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!.toInt());

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id!);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id as int);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id as int);
  }
}

class RemoveDuplicate extends VxMutation<MyStore> {
  final Item item;
  RemoveDuplicate(this.item);
  @override
  perform() {
    final ids = CatalogModel.items.map((e) => e.id).toSet();

    store!.cart._itemIds.retainWhere((element) => ids.remove(element));
  }
}

class CountItems extends VxMutation<MyStore> {
  final Item item;

  CountItems(this.item);

  @override
  perform() {
    final countItems = CatalogModel.items.map((e) => e.id).toSet();
    store!.cart.items.retainWhere((element) => countItems.add(element as int));
  }
}
