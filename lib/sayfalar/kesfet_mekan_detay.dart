import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:BursayiKesfet/model/mekan_detay.dart';
import 'package:BursayiKesfet/static/replacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:html/parser.dart';

class KesfetMekanDetay extends StatefulWidget {
  @override
  _KesfetMekanDetayState createState() => _KesfetMekanDetayState();
}

class _KesfetMekanDetayState extends State<KesfetMekanDetay> {
  AnasayfaBloc _anasayfaBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: _anasayfaBloc.mekanDetayStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MekanDetay mekan = snapshot.data;
            var content = parse(Replacer.replace(mekan.content));
            String imageRootUrl = "";
            return CustomScrollView(slivers: [
              SliverAppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 48,
                    ),
                    onPressed: () {
                      _anasayfaBloc.pageSink.add(2);
                    },
                  ),
                  expandedHeight: 200,
                  flexibleSpace: Swiper(
                    itemCount: mekan.medias.length,
                    autoplay: true,
                    autoplayDelay: 10000,
                    pagination: SwiperPagination(),
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          imageUrl: imageRootUrl + mekan.medias[index]);
                    },
                  )),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              mekan.title,
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "Roboto"),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Image.asset(
                                    'assets/icons/favorite.png',
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    print("");
                                  }),
                              Padding(padding: EdgeInsets.all(5)),
                              IconButton(
                                icon: Image.asset('assets/icons/rotaTodo.png'),
                                onPressed: () {
                                  print("");
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: size.width * 0.2,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/rotaRoute.png',
                                    scale: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Başla",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Roboto"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: size.width * 0.2,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/rotaHeadphones.png',
                                    scale: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Dinle",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Roboto"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: size.width * 0.2 + 15,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/rotaMap.png',
                                    scale: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Panorama",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Roboto"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Text(
                        "Detaylar",
                        style: TextStyle(fontSize: 22),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text.rich(TextSpan(
                          text: content.body.text,
                          style: TextStyle(fontSize: 18)))
                    ],
                  ),
                );
              }, childCount: 1))
            ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
