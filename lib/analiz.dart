import 'package:flutter/material.dart';
import 'package:flutter_appl/anasayfa.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  String kullaniciAdi, zaman, ders, analiz;
  double trOrt, net;
  //double net;
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    kullaniciAdi = data[0];
    net = data[1];
    zaman = data[2];
    ders = data[3];
    if (ders == "Türkçe") {
      trOrt = 5;
    }
    ;
    if (ders == "Matematik") {
      trOrt = 2.45;
    }
    ;
    if (ders == "Fen Bilimleri") {
      trOrt = 5.10;
    }
    ;
    if (ders == "Sosyal Bilimler") {
      trOrt = 5.05;
    }
    ;
    if (net > trOrt) {
      analiz = "Tebrikler! Türkiye " +
          ders +
          " net ortalaması olan 10 soruda " +
          trOrt.toString() +
          " netin üzerindesiniz. Başarılarınızın devamını dileriz!";
    } else if (net == trOrt) {
      analiz = "Netiniz Türkiye " +
          ders +
          " net ortalaması olan 10 soruda " +
          trOrt.toString() +
          " nete eşit. Eğer sıkı çalışırsanız eminiz ki ortalamayı geçeceksiniz.";
    } else {
      analiz = "Ne yazık ki netiniz Türkiye " +
          ders +
          " net ortalaması olan 10 soruda " +
          trOrt.toString() +
          " netin altında. Daha sıkı çalışmanız gerekli gibi görünüyor.";
    }
    ;
    return Scaffold(
      backgroundColor: Colors.grey,
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade100,
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(right: 20.0, left: 20, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kullaniciAdi + ",  Sınav Analiziniz: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "Sınavda Geçirdiğiniz Süre: " + zaman,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "Toplam Netiniz: " + net.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "Testini Çözdüğünüz Ders: " + ders,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      analiz,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                //Text(trOrt.toString()),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Anasayfa(),
                      settings: RouteSettings(arguments: data)));
            },
            child: Text("Anasayfaya Geri Dön ve Tekrar Dene"),
          ),
        ])));
  }
}
