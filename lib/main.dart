import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CST2335 Lab 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'BROWSE CATEGORIES'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
        centerTitle: true,
      ),
      body: Center(
        child:
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          child:
            SingleChildScrollView( child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories.", textAlign: TextAlign.center),
                      ]
                    ),
                  ),
                  Text("BY MEAT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('images/beef.jpg'),
                            radius: 100
                          ),
                          Text("BEEF",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                fontSize: 30.0, color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black45
                                  )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/chicken.jpg'),
                              radius: 100
                          ),
                          Text("CHICKEN",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 30.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black45
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/pork.jpg'),
                              radius: 100
                          ),
                          Text("PORK",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 30.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black45
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/seafood.jpg'),
                              radius: 100
                          ),
                          Text("SEAFOOD",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 30.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black45
                                    )]
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                  Text("BY COURSE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //CHANGE THESE TO STACKS****************************************************************** text below over top of image, bottom centered
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/mains.jpg'),
                              radius: 100
                          ),
                          Text("Main Dishes",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/salad.jpg'),
                              radius: 100
                          ),
                          Text("Salad Recipes",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/sides.jpg'),
                              radius: 100
                          ),
                          Text("Side Dishes",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/crockpot.jpg'),
                              radius: 100
                          ),
                          Text("Crockpot",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text("BY DESSERT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/ice_cream.jpeg'),
                              radius: 100
                          ),
                          Text("Ice Cream",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/brownies.jpg'),
                              radius: 100
                          ),
                          Text("Brownies",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/pies.jpg'),
                              radius: 100
                          ),
                          Text("Pies",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage('images/cookies.jpg'),
                              radius: 100
                          ),
                          Text("Cookies",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20.0, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    )]
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ),
        ),
      ),
    );
  }
}