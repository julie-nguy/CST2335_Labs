import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart'; // to import stateful widget
import 'package:url_launcher/url_launcher.dart';
import 'package:my_cst2335_labs/DataRepository.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late EncryptedSharedPreferences prefs;
  late String login;
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    prefs = EncryptedSharedPreferences();
    loadPrefs();

    login = DataRepository.login;

    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();

    Future.delayed(Duration.zero, () {
      var snackBar = SnackBar(
          content: Text("Welcome Back $login!"),
          duration: const Duration(minutes: 2),
          action: SnackBarAction(
            label: "Hiya",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          )
        );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    );
  }

  void loadPrefs() async {
    var fName = await prefs.getString("fName");
    var lName = await prefs.getString("lName");
    var phone = await prefs.getString("phone");
    var email = await prefs.getString("email");

    _fNameController.text = fName;
    _lNameController.text = lName;
    _phoneController.text = phone;
    _emailController.text = email;
  }

  @override
  void dispose() {
    //could save data here

    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Profile")
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Welcome back $login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
              TextField(
                onChanged: (fName) => { prefs.setString("fName" ,_fNameController.value.text) },
                controller: _fNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                )
              ),
              TextField(
                onChanged: (lName) => { prefs.setString("lName", _lNameController.value.text) },
                controller: _lNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                )
              ),
              Row(
                children: <Widget>[
                  Flexible(
                      child:
                        TextField(
                          onChanged: (phone) => { prefs.setString("phone", _phoneController.value.text) },
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                          )
                        ),
                  ),
                  IconButton(
                      onPressed: () async{
                        var phoneStr = "tel:" + _phoneController.value.text;
                        var result = await canLaunchUrlString(phoneStr);
                        if(result) { //is there another way to check this? currently it results as always true it seems
                          launchUrlString(phoneStr);
                        }
                        else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) { return AlertDialog(
                                title: const Text("Could not call this phone number."),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                                ],
                              );
                              }
                          );
                        }
                      },
                      icon: Icon(Icons.call)
                  ),
                  IconButton(
                      onPressed: () async{
                        var smsStr = "sms:" + _phoneController.value.text;
                        var result = await canLaunchUrlString(smsStr);
                        if(result) {
                          launchUrlString(smsStr);
                        }
                        else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) { return AlertDialog(
                                title: const Text("Could not message this phone number."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ],
                              );
                              }
                          );
                        }
                      },
                      icon: Icon(Icons.sms)
                  )
                ]
              ),
              Row(
                children: <Widget> [
                  Flexible(
                    child: TextField(
                      onChanged: (email) => { prefs.setString("email", _emailController.value.text) },
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(),
                      )
                    )
                  ),
                  IconButton(
                      onPressed: () async {
                        var emailStr = "mailto:" + _emailController.value.text;
                        var result = await canLaunchUrlString(emailStr);
                        if(result) {
                          launchUrlString(emailStr);
                        }
                        else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) { return AlertDialog(
                                title: const Text("Could not email this email address."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ],
                              );
                              }
                          );
                        }
                      },
                      icon: Icon(Icons.email))
                ]
              ),
            ]
          )
        )
    );
  }
}