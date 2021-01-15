import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:BursayiKesfet/bloc/giris_bloc.dart';
import 'package:BursayiKesfet/sayfalar/anasayfa.dart';

import 'package:BursayiKesfet/sayfalar/giris_ekrani.dart';

import 'package:flutter/material.dart';

void main() => runApp(RootWidget());

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  GirisBloc _girisBloc;
  AnasayfaBloc _anasayfaBloc;
  @override
  void initState() {
    super.initState();
    _girisBloc = GirisBloc();
    _anasayfaBloc = AnasayfaBloc();
  }

  @override
  Widget build(BuildContext context) {
    return AnasayfaBlocProvider(
      anasayfaBloc: _anasayfaBloc,
      child: StreamBuilder(
        stream: _girisBloc.girisEkraniGecStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return _materialAppOlustur(GirisEkrani());
          } else {
            return _materialAppOlustur(AnaSayfa());
          }
        },
      ),
    );
  }

  Widget _materialAppOlustur(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: child,
    );
  }
}
