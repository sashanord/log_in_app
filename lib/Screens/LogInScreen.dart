import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _tEContEmail = TextEditingController();
  TextEditingController _tEdContPass = TextEditingController();

  bool _remember = false;

  late SharedPreferences _prefs;

  final _formKey = GlobalKey<FormState>();
  @override
  initState()  {
    super.initState();
    getPrefs();
    print(_remember);
    if(_remember) {
      print('aaa');
      Navigator.pushNamed(context,'/profileScreen' );
    }
  }

  getPrefs() async{
    _prefs = await SharedPreferences.getInstance();
    _remember = _prefs.get('remember') as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('LOG IN'),),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _tEContEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E-mail adress'
              ) ,
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Введите E-mail!';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _tEdContPass,
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
              _checkInfo();
            }, child: Text('SIGN IN')),

            CheckboxListTile(onChanged: (bool? value) { setState(() {
              _remember = value!;
            }); }, value: _remember,),

            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/registration',arguments: _prefs);
            }, child: Text('Create an account')),
          ],
        ),
      ),
    );
  }

  _checkInfo() async{
    var email = _prefs.get('Email') ?? null;
    var pass = _prefs.get('Password') ?? null;
    if (email == _tEContEmail.text && pass ==_tEdContPass.text){
      Navigator.pushNamed(context, '/profileScreen');
    }
    _prefs.setBool('remember', _remember);

  }
}
