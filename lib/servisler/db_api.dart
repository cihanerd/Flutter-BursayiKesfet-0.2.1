import 'package:BursayiKesfet/model/mekan_detay.dart';

import '../model/kategori.dart';
import '../model/mekan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DbApi {
  String url = "http://yeni.bursa.com.tr/json.php?part=places";
  Future<List<Mekan>> mekanlariGetir(String id) async {
    String sorgu = url + "&limit=100&cat=47";
    http.Response response = await http.get(sorgu,
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    String source = Utf8Decoder().convert(response.bodyBytes);
    Map responseJson = json.decode(source);
    Places places = Places.fromJson(responseJson);
    return places.places;
  }

  Future<List<Kategori>> kategorileriGetir() async {
    http.Response response = await http.get(
        "http://yeni.bursa.com.tr/json.php?part=place_cats",
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    List responseJson = json.decode(response.body);
    return responseJson.map((m) => new Kategori.fromJson(m)).toList();
  }

  Future<MekanDetay> mekanGetir(String id) async {
    String sorgu = "http://yeni.bursa.com.tr/json.php?part=place&id=$id";
    http.Response response = await http.get(sorgu,
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    Map responseJson = json.decode(response.body);
    MekanDetay mekan = MekanDetay.fromJson(responseJson);
    return mekan;
  }
}
