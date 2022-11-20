import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _tEContName = TextEditingController();
  TextEditingController _tEContLasName = TextEditingController();
  TextEditingController _tEContEmail = TextEditingController();
  TextEditingController _tEContMob = TextEditingController();
  TextEditingController _tEContPass = TextEditingController();

  late SharedPreferences _prefs;

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    _prefs = ModalRoute.of(context)?.settings.arguments as SharedPreferences;

    return Scaffold(
      appBar: AppBar(title: Text('Create an account'),),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _tEContName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Имя должно быть не пустым!';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tEContLasName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Second Name'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Укажите фмилию!!';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tEContEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E-mail'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Укажите почтовый адрес!';
                }
                else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)){
                  return 'Неправильный  e-mail';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tEContMob,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mobile Number'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Укажите номер телефона!';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _tEContPass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Введите пароль!';
                }

                return null;
              },
            ),
            TextButton(onPressed: () {
              if (_formKey.currentState!.validate())
              {
                      _addInformation();
                      Navigator.pop(context);
                    }
                  }, child: Text('SIGN IN'))
            ],
      ),
    ));
  }

  _addInformation() async{
    _prefs.setString('UserName', '${_tEContName.text} ${_tEContLasName.text}');
    _prefs.setString('Email', _tEContEmail.text);
    _prefs.setString('Number', _tEContMob.text);
    _prefs.setString('Password', _tEContPass.text);
  }
}
