import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'DataRepository.dart';
import 'ProfilePage.dart';
import 'ShoppingItem.dart';
import 'ShoppingItemDatabase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Lab 6'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _itemController;
  late TextEditingController _quantityController;
  late var myDAO;

  List<ShoppingItem> shoppingList = [ ];
  List<String> items = [ ]; //array for items
  List<String> quantities = [ ]; //array for quantity

  @override
  void initState() {
    super.initState();
    _itemController = TextEditingController();
    _quantityController = TextEditingController();

    //open db
    $FloorShoppingItemDatabase.databaseBuilder('app_database.db')
        .build().then( (database) async {
          myDAO = database.getDao;

          var results = await myDAO.getAllShoppingItems();

          setState(() {
            //add results to our list:
            shoppingList = results;
          });

        });
  }

  @override
  void dispose() {

    _itemController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(40),
          child: ListPage(    )
        ),
      ),
    );
  }
  Widget ListPage() {
    return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: TextField(
                  controller: _itemController,
                  decoration: InputDecoration(
                  labelText: "Type the item here",
                  border: OutlineInputBorder(),
                )
            )),
            Expanded(child: TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                  labelText: "Type the quantity here",
                  border: OutlineInputBorder(),
                )
            )),
            ElevatedButton(child: Text("Click here"), onPressed:() {
              setState((){
                if(_itemController.value.text.isNotEmpty && _quantityController.value.text.isNotEmpty) {

                    var item = _itemController.value.text; //store values in variables
                    var quantity = _quantityController.value.text;

                    // items.add(item); //add values to respective lists
                    // quantities.add(quantity);

                    var newItem = ShoppingItem(ShoppingItem.ID++, item, quantity);
                    shoppingList.add(newItem);

                    myDAO.addShoppingItem(newItem);

                    _itemController.text = ""; //clear textfields
                    _quantityController.text = "";

                }
                else {
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                            title: Text("Please input a value for both fields."),
                            actions: [
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: Text("OK"),
                              )
                            ]
                        );
                      }
                  );
                }
              });

            })
          ]
        ),
        shoppingList.length > 0 ?
          Expanded(
            child: ListView.builder(
            itemCount: shoppingList.length,
            itemBuilder: (context, rowNumber) {
              return
                  GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: Text("Would you like to delete this item?"),
                              actions: [
                                FilledButton(
                                  onPressed: (){
                                    //delete from db first
                                    myDAO.deleteShoppingItem(shoppingList[rowNumber]);
                                    setState((){
                                      //delete from list
                                      shoppingList.removeAt(rowNumber);
                                    });
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("Yes"),
                                ),
                                OutlinedButton(
                                  onPressed: (){
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("No"),
                                ),
                              ]
                            );
                          }
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${rowNumber+1}: ${shoppingList[rowNumber].name}  quantity: ${shoppingList[rowNumber].quantity}")
                        ]
                    )
                  );
            }
          )
        )
        : Text("There are no items in the list."),
      ]
    );
  }
}