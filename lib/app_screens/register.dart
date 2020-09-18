import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registerVerifyCode.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  State createState() => new RegisterPageState();
}

class RegisterPageState extends State<Register> {
  bool _isLoading = false;

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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: new IconButton(
                          icon: new Icon(Icons.arrow_back, color: Colors.grey),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()),
                                (Route<dynamic> route) => false);
                          }),
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
                            margin: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Пароль'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: passwordController,
                            ),
                          ),
                          Container(
                            width: 380,
                            margin: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Подтвердите Пароль'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: reEnteredPasswordController,
                            ),
                          ),
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
                                register(
                                  phoneController.text,
                                  passwordController.text,
                                  reEnteredPasswordController.text,
                                );
                              },
                              child: Text(
                                'Далее ',
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

  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reEnteredPasswordController =
      new TextEditingController();

  register(String phone, pass, reEnteredPass) async {
    if (pass != '' && reEnteredPass != '' && phone != '') {
      if (pass == reEnteredPass) {
        String url = "https://192.168.88.61:5201/api/mobile/Account/register";
        Map data = {
          "email": phone,
          "password": pass,
        };

        HttpClient client = new HttpClient();
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);

        HttpClientRequest request = await client.postUrl(Uri.parse(url));

        request.headers.set('content-type', 'application/json');

        request.add(utf8.encode(json.encode(data)));

        HttpClientResponse response = await request.close();

        // String reply = await response.transform(utf8.decoder).join();

        if (response.statusCode == 200) {
          setState(() {
            _isLoading = false;
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => RegisterVeryfingCode(
                    userEmail: phone,
                  ),
                ),
                (Route<dynamic> route) => false);
          });
        } else {
          setState(() {
            _isLoading = false;
          });
          print('error');
          // final errorExeption = 'error';
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        print('Passwords are not same');
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print('empty');
    }
  }
}
