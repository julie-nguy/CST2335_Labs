import 'package:floor/floor.dart';

@entity
class ShoppingItem {
  //constructor
  ShoppingItem(this.id, this.name, this.quantity)
  {
    if(this.id >= ID)
      ID = this.id + 1;
  }
  static int ID = 1; //start ID at 1; belong to class

  @primaryKey //primary key
  final int id;
  //attributes
  String name;
  String quantity;

}