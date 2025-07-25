import 'package:floor/floor.dart';
import 'ShoppingItem.dart';

@dao
abstract class ShoppingItemDAO {
  //select all
  @Query("SELECT * FROM ShoppingItem")
  Future<List<ShoppingItem>> getAllShoppingItems();

  @insert
  Future<void> addShoppingItem(ShoppingItem toBeInserted);

  @delete
  Future<void> deleteShoppingItem(ShoppingItem toBeDeleted);

  @update
  Future<void> updateShoppingItem(ShoppingItem toBeUpdated);
}