import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'ShoppingItemDAO.dart';
import 'ShoppingItem.dart';

part 'ShoppingItemDatabase.g.dart';

@Database(version:1, entities: [ShoppingItem])
abstract class ShoppingItemDatabase extends FloorDatabase {
  ShoppingItemDAO get getDao;
}