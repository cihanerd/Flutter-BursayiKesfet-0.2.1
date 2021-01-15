import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:BursayiKesfet/bloc/fab_icon_bloc.dart';
import 'package:BursayiKesfet/bloc/fab_icon_bloc_provider.dart';
import 'package:BursayiKesfet/sayfalar/anasayfa.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class KategoriListe extends StatefulWidget {
  @override
  _KategoriListeState createState() => _KategoriListeState();
}

class _KategoriListeState extends State<KategoriListe> {
  AnasayfaBloc _anasayfaBloc;
  FabIkonBloc _fabIkonBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  void initState() {
    super.initState();
    _fabIkonBloc = FabIkonBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FabIkonBlocProvider(
      fabIkonBlocc: _fabIkonBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Kategoriler',
            style: TextStyle(fontSize: 22.0),
          ),
        ),
        body: ListView.builder(
          itemCount: _anasayfaBloc.kategoriler.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _anasayfaBloc.kategoriler[index].title,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
