import 'package:BursayiKesfet/sayfalar/kesfet_yemek_detay.dart';
import 'package:flutter/material.dart';

class KesfetBursaYemekleri extends StatefulWidget {
  @override
  _KesfetBursaYemekleriState createState() => _KesfetBursaYemekleriState();
}

class _KesfetBursaYemekleriState extends State<KesfetBursaYemekleri> {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 16.0, bottom: 16, top: 10.0),
            child: Text(
              "Bursa Yemekleri",
              style: TextStyle(fontSize: 24.0),
            )),
        Container(
          padding: EdgeInsets.only(left: 16.0, top: 40.0),
          width: cWidth,
          child: new Column(
            children: [
              new Text(
                "Bu kültürün meydana getirdiği Bursa mutfağı, günümüz Türk mutfağına hediye ettiği birçok yemek ve tatlılarıyla bilinmektedir.",
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, top: 90.0, right: 16.0),
          width: cWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => YemekDialog(
                      baslik: "Bursa Döner Kebabı",
                      aciklama:
                          "Köklü bir geçmişi, pişirme şekli ve kendine has sunumuyla Bursa yemek kültürünün en köklü ve en özel ürünlerinden birisi olan bu lezzet, ilk olarak kebapçıların yaygın olduğu Bursa’nın Kayhan çarşısında ortaya çıkmıştır. Bursa denince akla ilk gelen lezzetlerden bir tanesidir. Uludağ yaylalarındaki otlar ve kekik ile beslenen kuzuların etleri ve dana eti karıştırılarak kıyma haline getirilip şişe geçirilir. Sonrasında dikey olarak, kömür ateşinin etrafında döndürülerek kızartılır. Kızartılan etler bıçakla ince ince kesilerek servis için hazırlanan tabakta yer alan kızartılmış ve küp şeklinde kesilmiş pidelerin üzerine konulur. Son olarak üzerine domates sosu, tereyağı gezdirilip kenarına yoğurt ve közlenmiş patlıcan konularak servis edilir.",
                      butonText: "Kapat",
                      img:
                          'http://yeni.bursa.com.tr/uploads/2020/10/_0010_layer-16.png',
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: 112,
                    width: 112,
                    child: Image.asset('assets/images/yemek1.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 112,
                  width: 112,
                  child: Image.asset('assets/images/yemek2.png'),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 112,
                  width: 112,
                  child: Image.asset('assets/images/yemek3.png'),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, top: 210.0, right: 16.0),
          width: cWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 112,
                  width: 112,
                  child: Image.asset('assets/images/yemek4.png'),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 112,
                  width: 112,
                  child: Image.asset('assets/images/yemek5.png'),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => YemekDialog(
                      baslik: 'Tahinli Pide',
                      aciklama:
                          "XIX. yy'ın ikinci yarısında Balkan göçmenleri ile Bursa'ya gelen bu lezzet, Bursa’da kahvaltıların vazgeçilmezidir.\nBursa’da birçok pastane ve fırınlarda bulabileceğiniz bu lezzet, mayalı hamurun üzerine pekmezli tahin ve az miktarda şekerin dökülmesiyle hazırlanır. Sonrasında taş fırınlarda pişirilerek servise hazır hale getirilir.",
                      butonText: 'Kapat',
                      img:
                          'http://yeni.bursa.com.tr/uploads/2020/10/tahinli-pide-1.jpg',
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: 112,
                    width: 112,
                    child: Image.asset('assets/images/yemek6.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
