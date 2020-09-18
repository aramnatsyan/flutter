import 'package:delse/app_screens/login.dart';
import 'package:delse/app_screens/register.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class RegisterVeryfingCode extends StatefulWidget {
  String userEmail;

  RegisterVeryfingCode({this.userEmail});

  @override
  _RegisterVeryfingCodeState createState() =>
      _RegisterVeryfingCodeState(userEmail);
}

class _RegisterVeryfingCodeState extends State<RegisterVeryfingCode> {
  bool _isLoading = false;
  String userEmail;

  _RegisterVeryfingCodeState(this.userEmail);

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
                                    builder: (BuildContext context) =>
                                        Register()),
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
                                hintText: 'Ваш код подтверждения',
                              ),
                              keyboardType: TextInputType.number,
                              controller: veryfingCodeController,
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
                                veryfingCode(veryfingCodeController.text);
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

  // TextEditingController emailController = new TextEditingController();
  TextEditingController veryfingCodeController = new TextEditingController();

  veryfingCode(String veryfingCode) async {
    if (veryfingCode != '') {
      setState(() {
        _isLoading = false;
      });
      String url =
          "https://192.168.88.61:5201/api/mobile/Account/VerifyViaEmail";
      Map data = {
        "currentEmail": userEmail,
        "code": veryfingCode,
      };

      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      HttpClientRequest request = await client.postUrl(Uri.parse(url));

      request.headers.set('content-type', 'application/json');

      request.add(utf8.encode(json.encode(data)));

      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Login()),
              (Route<dynamic> route) => false);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // final errorExeption = 'error';
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
