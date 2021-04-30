import 'package:flutter/material.dart';
import 'package:flutter_appl/dersler/fensorular.dart';
import 'package:flutter_appl/dersler/matematiksorular.dart';
import 'package:flutter_appl/dersler/sosyalsorular.dart';
import 'package:flutter_appl/dersler/turkcesorular.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = (ModalRoute.of(context).settings.arguments);
    var kullaniciAdi = data[0];
    var email = data[1];
    var sifre = data[2];
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Test Listesi",
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey
                    ),
                    child: Text("Testler:",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      color: Colors.white
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red.shade200
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TurkceSorular(),
                                    settings: RouteSettings(
                                      arguments: data,
                                    )),
                              );
                            },
                            child: Text("Türkçe",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MatematikSorular(),
                                    settings: RouteSettings(
                                      arguments: data,
                                    )),
                              );
                            },
                            child: Text("Matematik",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FenSorular(),
                                    settings: RouteSettings(
                                      arguments: data,
                                    )),
                              );
                            },
                            child: Text("Fen Bilimleri",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SosyalSorular(),
                                    settings: RouteSettings(
                                      arguments: data,
                                    )),
                              );
                            },
                            child: Text("Sosyal Bilgiler",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
