import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 4'),
      debugShowCheckedModeBanner: false,
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
  var imageSource = "images/question-mark.png";
  late TextEditingController _loginController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    getPreferences();

    _loginController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void buttonClicked() {
    if(_passController.value.text == "QWERTY123") {
      setState(() {
        imageSource = "images/idea.png";
      });
    }
    else {
      setState(() {
        imageSource = "images/stop.png";
      });
    }
  }

  //get encrypted preferences for the application
  void getPreferences() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    var login = await prefs.getString("Login");
    var pass = await prefs.getString("Password");

    if(login.isNotEmpty && pass.isNotEmpty) {
      _loginController.text = login;
      _passController.text = pass;
      Future.delayed(Duration.zero, () {
          var snackBar = SnackBar(
              content: Text("Your login credentials have been saved."),
              duration: const Duration(minutes: 2),
              action: SnackBarAction(
                  label: "Got it!",
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  }
              )
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _loginController, decoration: InputDecoration(
              hintText: "Type in your login information here...",
              border: OutlineInputBorder(),
              labelText: "Login",
            )),
            TextField(controller: _passController, obscureText:true, decoration: InputDecoration(
              hintText: "Type in your password here...",
              border: OutlineInputBorder(),
              labelText: "Password"
            )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx)
                    {
                      return AlertDialog(
                        title: Text("Would you like to save your username and password?"),
                        actions: [
                          FilledButton(
                            onPressed: (){
                              EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
                              prefs.setString("Login", _loginController.value.text); //save login to encrypted preferences
                              prefs.setString("Password", _passController.value.text); //save password to encrypted preferences
                              Navigator.pop(ctx); //close the pop-up
                            },
                            child: Text("Yes"),
                          ),
                          OutlinedButton(
                            onPressed: (){
                              EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
                              prefs.clear(); //remove saved data
                              Navigator.pop(ctx);
                            },
                            child: Text("No"),
                          ),
                        ],
                      );
                    }
                  );
                },
                child: Text("Login", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ),
            Image.asset(imageSource, width: 300, height: 300),
          ],
        ),
      ),
    );
  }
}