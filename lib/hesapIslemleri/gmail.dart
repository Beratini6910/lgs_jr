import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appl/anasayfa.dart';
import 'package:flutter_appl/hata.dart';
import 'dart:async';

import 'package:flutter_appl/hesapIslemleri/hesap_olustur.dart';

class Gmail extends StatefulWidget {
  @override
  _GmailState createState() => _GmailState();
}

class _GmailState extends State<Gmail> {
  final _formKontrolg = GlobalKey<FormState>();
  String email1, sifre1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Gmail ile Giriş",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.purple.shade200,
        body: Form(
          key: _formKontrolg,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Gmail Hesabınızı giriniz.",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (GirilenDeger) {
                        if (GirilenDeger.isEmpty) {
                          return "Gmail Hesabı boş bırakılamaz.";
                        } else if (!GirilenDeger.contains("@gmail")) {
                          return "Lütfen sadece Gmail formatı giriniz.";
                        }
                        return null;
                      },
                      onSaved: (GirilenDeger) => email1 = GirilenDeger),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Şifrenizi giriniz.",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (GirilenDeger) {
                        if (GirilenDeger.isEmpty) {
                          return "Şifre boş bırakılamaz.";
                        } else if (GirilenDeger.length < 7) {
                          return "Şifre en az 8 değerden oluşmalıdır.";
                        }
                        return null;
                      },
                      onSaved: (GirilenDeger) => sifre1 = GirilenDeger),
                  SizedBox(height: 40),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade100,
                          padding: EdgeInsets.all(20)),
                      onPressed: _girisYap,
                      child: Text(
                        "Gmail ile Giriş yap",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.red),
                      )),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => HesapOlustur()));
          },
                      child: Text(
                        "Hesabınız yok mu? Hemen üye olun!",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  void _girisYap() {
    var _formState = _formKontrolg.currentState;
    _formState.validate();
    if (_formState.validate()) {
      _formState.save();
      show();
      var data = [];
      String email;
      data = (ModalRoute.of(context).settings.arguments);
      email = data[1];
      var sifre = data[2];
      if (email == email1 && sifre == sifre1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Anasayfa(),
                settings: RouteSettings(
                  arguments: data,
                )));
      } else if (email != email1 && sifre == sifre1 ||
          email == email1 && sifre != sifre1) {
        show();
      } else if (email != email1 && sifre != sifre1) {
        show();
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Hata()));
      }
    }
  }

  Future show() {
    /*Timer timer = Timer(Duration(milliseconds: 3000), (){
      Navigator.of(context, rootNavigator: true).pop();
    });*/
    return showDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
                title: new Text("Hatalı Giriş Yaptınız"),
                content: new Text(
                    "Hatalı Gmail veya şifre girdiniz. Lütfen tekrar deneyiniz."),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: new Text("Close"),
                    onPressed: () => Navigator.pop(context),
                  )
                ]));
  }
}
