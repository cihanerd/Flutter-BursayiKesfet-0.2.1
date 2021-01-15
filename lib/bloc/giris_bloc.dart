import 'dart:async';

class GirisBloc {
  StreamController<bool> girisEkraniController =
      StreamController<bool>.broadcast();
  Sink<bool> get _girisEkraniGecSink => girisEkraniController.sink;
  Stream<bool> get girisEkraniGecStream => girisEkraniController.stream;

  GirisBloc() {
    _sureyiBaslat();
  }
  void dispose() {
    girisEkraniController.close();
  }

  void _sureyiBaslat() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      _girisEkraniGecSink.add(true);
    });
  }
}
