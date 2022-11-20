import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  String? phone;
  String? email;
  String? text;


  late SharedPreferences _prefs;

  @override
  initState()  {
    super.initState();

    getPrefs().whenComplete(() {
      setState(() {

      });
    });

  }

  getPrefs() async{
    _prefs = await SharedPreferences.getInstance();

    name = _prefs.get('UserName') as String;
    phone = _prefs.get('Email') as String;
    email = _prefs.get('Number') as String;
    text = 'Расскажите о себе';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Column(
        children: [
          Text(name ?? 'name'),
          Text(phone ?? ''),
          Text(email ?? ''),
          Text(text ?? ''),
        ],
      ),
    );
  }

}
