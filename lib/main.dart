import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                onPressed: buttonClicked,
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