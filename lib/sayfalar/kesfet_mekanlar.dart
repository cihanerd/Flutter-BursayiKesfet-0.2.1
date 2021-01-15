import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:flutter/material.dart';

class KesfetMekanlar extends StatefulWidget {
  @override
  _KesfetMekanlarState createState() => _KesfetMekanlarState();
}

class _KesfetMekanlarState extends State<KesfetMekanlar> {
  AnasayfaBloc _anasayfaBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 48,
          ),
          onPressed: () {
            _anasayfaBloc.pageSink.add(0);
          },
        ),
        expandedHeight: 150,
        pinned: true,
        title: Text(
          "Mekanlar",
          style: TextStyle(fontSize: 30.0),
        ),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/ustbosluk.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              _anasayfaBloc.pageSink.add(3);
              _anasayfaBloc.mekanIdSink.add(_anasayfaBloc.mekanlar[index].id);
            },
            child: Container(
              alignment: Alignment.center,
              width: 400,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      _anasayfaBloc.mekanlar[index].thumb,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10,
                      left: 8,
                      child: RaisedButton.icon(
                        icon: Image.asset(
                          'assets/icons/Location.png',
                          scale: 40,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Uludağ/Osmangazi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Open Sans",
                          ),
                        ),
                        onPressed: null,
                        disabledColor: Colors.transparent,
                        color: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 3,
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/favorite.png',
                        ),
                        onPressed: () => {
                          print("favorite.png"),
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 8,
                      right: 8,
                      child: Text(
                        _anasayfaBloc.mekanlar[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 2,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow.shade800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }, childCount: _anasayfaBloc.mekanlar.length))
    ]);
  }
}
