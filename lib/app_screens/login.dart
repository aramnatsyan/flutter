import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:flutter/services.dart';
import 'profile.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<Login> {
  bool _isLoading = false;
  String _emailError = '';
  String _passError = '';
  Map _loginErrors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 60.0),
                      child: Image.asset(
                        'assets/logo/delse_logo_L-efb6f2e3ef2676f55f5d8550b8df303f-1b121b.png',
                        width: 250,
                      ),
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 380,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                              ),
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                            ),
                          ),
                          Container(
                            width: 380,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Пароль'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: passwordController,
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(top: 10.0),
                              width: 380,
                              child: Link(
                                child: Text('Забыли пароль?'),
                                url: 'https://www.google.com',
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500.0),
                              // color: Colors.yellow[600],
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 60.0),
                            // width: 300,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.yellow[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                signIn(phoneController.text,
                                    passwordController.text);
                              },
                              child: Text(
                                'Войти',
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 60.0),
                            // width: 300,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Register()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                'ЗАРЕГИСТРИРОВАТЬСЯ',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  signIn(String phone, pass) async {
    Map data = {
      "email": phone,
      "password": pass,
    };

    String url = "https://192.168.88.61:5201/api/mobile/Account/Login";

    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(url));

    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(data)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      final userData = jsonDecode(reply) as Map;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => UserProfile(
              userData: userData['userProfile'],
            ),
          ),
          (Route<dynamic> route) => false);
    } else {
      final errors = jsonDecode(reply) as Map;

      setState(() {
        _isLoading = false;
        _loginErrors = errors['errors'] as Map;

        if (_loginErrors.containsKey('Email')) {
          _emailError = _loginErrors['Email'].toString();
          _emailError = _emailError.replaceAll('[', '');
          _emailError = _emailError.replaceAll(']', '');
        }

        if (_loginErrors.containsKey('Password')) {
          _passError = _loginErrors['Password'].toString();
          _passError = _passError.replaceAll('[', '');
          _passError = _passError.replaceAll(']', '');
        }
      });
      Future<void> _showMyDialog() async {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ooops'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(_emailError),
                    Text(_passError),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      _showMyDialog();
    }
  }
}
