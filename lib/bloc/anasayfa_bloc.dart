import 'dart:async';

import 'package:BursayiKesfet/model/kategori.dart';
import 'package:BursayiKesfet/model/mekan.dart';
import 'package:BursayiKesfet/model/mekan_detay.dart';
import 'package:BursayiKesfet/servisler/db_api.dart';

class AnasayfaBloc {
  DbApi _dbApi;
  List<Kategori> kategoriler;
  List<Mekan> mekanlar;

  StreamController<List<Kategori>> _kategoriStreamController =
      StreamController<List<Kategori>>.broadcast();
  Sink<List<Kategori>> get kategorilerSink => _kategoriStreamController.sink;
  Stream<List<Kategori>> get kategorilerStream =>
      _kategoriStreamController.stream;

  StreamController<List<Mekan>> _mekanStreamController =
      StreamController<List<Mekan>>.broadcast();
  Sink<List<Mekan>> get mekanlarSink => _mekanStreamController.sink;
  Stream<List<Mekan>> get mekanlarStream => _mekanStreamController.stream;

  StreamController<MekanDetay> _mekanDetayStreamController =
      StreamController<MekanDetay>.broadcast();
  Sink<MekanDetay> get mekanDetaySink => _mekanDetayStreamController.sink;
  Stream<MekanDetay> get mekanDetayStream => _mekanDetayStreamController.stream;

  StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();
  Sink<int> get pageSink => _pageStreamController.sink;
  Stream<int> get pageStream => _pageStreamController.stream;

  StreamController<String> _mekanIdStreamController =
      StreamController<String>.broadcast();
  Sink<String> get mekanIdSink => _mekanIdStreamController.sink;
  Stream<String> get mekanIdStream => _mekanIdStreamController.stream;

  AnasayfaBloc() {
    _dbApi = DbApi();
    _verileriGetir();
    mekanIdStream.listen((id) {
      _dbApi.mekanGetir(id).then((value) => mekanDetaySink.add(value));
    });
  }

  void dispose() {
    _kategoriStreamController.close();
    _mekanStreamController.close();
    _pageStreamController.close();
    _mekanDetayStreamController.close();
    _mekanIdStreamController.close();
  }

  void _verileriGetir() {
    _dbApi.kategorileriGetir().then((value) {
      kategorilerSink.add(value);
      kategoriler = value;
    });
    _dbApi.mekanlariGetir("67").then((value) {
      mekanlarSink.add(value);
      mekanlar = value;
    });
    _dbApi.mekanlariGetir("47").then((value) {
      mekanlarSink.add(value);
      mekanlar.addAll(value);
    });
  }
}
