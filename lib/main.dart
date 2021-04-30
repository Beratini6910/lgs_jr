import 'package:flutter/material.dart';
import 'package:flutter_appl/anasayfa.dart';
import 'package:flutter_appl/hesapIslemleri/gmail.dart';
import 'package:flutter_appl/hakkinda.dart';
import 'package:flutter_appl/hesapIslemleri/hesap_olustur.dart';
import 'package:flutter_appl/hesapIslemleri/mail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giriş Sayfası',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.purple.shade600,
        accentColor: Colors.red,
      ),
      home: GirisSayfasi(),
    );
  }
}

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 50),
            FlutterLogo(
              size: 70.0,
            ),
            SizedBox(height: 25),
            Text(
              "LGS JR.",
              style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  shadows: [Shadow(color: Colors.black, offset: Offset(3, 3))]),
            ),
            SizedBox(height: 25),
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 30,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HesapOlustur()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Hesap Oluştur",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mail()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Hotmail ile Giriş",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Gmail()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Gmail ile Giriş",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.purple[500],
                          Colors.purple[100],
                          Colors.purple[500],
                        ])),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 70,
                height: 180,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: _kisayol,
              child: Text(
                "Hakkında",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ]),
        ));
  }

  void _kisayol() {
    var data = [];
    String kullaniciAdi="KullaniciAdi",email="Email",sifre="Sifre";

    data.add(kullaniciAdi);
    data.add(email);
    data.add(sifre);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Hakkinda(),
            settings: RouteSettings(
              arguments: data,
            )));

  }
}

