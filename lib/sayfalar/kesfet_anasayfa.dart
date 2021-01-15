import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_bursa_yemekleri.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_etkinlikler.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_mekan_detay.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_mekanlar.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_rotalar.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_yakinlarimda_ne_var.dart';
import 'package:BursayiKesfet/sayfalar/kesfet_yapmadan_gecme.dart';
import 'package:flutter/material.dart';

class KesfetAnasayfa extends StatefulWidget {
  @override
  _KesfetAnasayfaState createState() => _KesfetAnasayfaState();
}

class _KesfetAnasayfaState extends State<KesfetAnasayfa> {
  PageController _controller;
  AnasayfaBloc _anasayfaBloc;
  bool geriTusu = false;
  String title = "Keşfet";
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // _anasayfaBloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
    _anasayfaBloc.pageStream.listen((sayfa) {
      _controller.animateToPage(sayfa,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              pinned: true,
              title: Text(
                "Keşfet",
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
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      KesfetAnasayfaRotalar(),
                      KesfetAnasayfaMekanlar(),
                      KesfetYakinlarimdaNevar(),
                      KesfetYapmadanGecme(),
                      KesfetBursaYemekleri(),
                      KesfetEtkinlikler(),
                      Padding(padding: EdgeInsets.only(bottom: 110.0)),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
        KesfetRotalar(),
        KesfetMekanlar(),
        KesfetMekanDetay(),
      ],
    );
  }
}

class OzelSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  String title;
  TextAlign alignText;

  OzelSliverAppBar({this.expandedHeight, this.title, this.alignText});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight;
    final cardTopPosition = expandedHeight - shrinkOffset - 18;
    return SizedBox(
      height: this.expandedHeight + 18,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight
                ? kToolbarHeight
                : appBarSize - shrinkOffset,
            child: AppBar(
              //elevation: 5,
              toolbarHeight: appBarSize,
              title: Text(
                "$title",
                style: TextStyle(fontSize: 36),
                textAlign: alignText,
              ),
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/ustbosluk.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: cardTopPosition > 50 ? 0 : 200,
            right: 0,
            top: cardTopPosition > 10 ? cardTopPosition : 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: _Search(),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: Colors.green.withOpacity(0.23),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => expandedHeight + 18.0;

  @override
  double get minExtent => kToolbarHeight;
}

class _Search extends StatefulWidget {
  _Search({Key key}) : super(key: key);

  @override
  __SearchState createState() => __SearchState();
}

class __SearchState extends State<_Search> {
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _editingController,
              // textAlignVertical: TextAlignVertical.center,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Arama',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          _editingController.text.trim().isEmpty
              ? IconButton(
                  icon:
                      Icon(Icons.search, color: Colors.black.withOpacity(0.5)),
                  onPressed: null)
              : IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  onPressed: () => setState(
                    () {
                      _editingController.clear();
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class KesfetAnasayfaMekanlar extends StatefulWidget {
  @override
  _KesfetAnasayfaMekanlarState createState() => _KesfetAnasayfaMekanlarState();
}

class _KesfetAnasayfaMekanlarState extends State<KesfetAnasayfaMekanlar> {
  var _mySelection;
  AnasayfaBloc _anasayfaBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mekanlar',
              style: TextStyle(fontSize: 24),
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.all(0.0),
              children: [
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bursa'nın Tüm Mekanları"),
                  GestureDetector(
                    child: Text(
                      "detay...",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                    ),
                    onTap: () {
                      _anasayfaBloc.pageSink.add(2);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _anasayfaBloc.mekanlar.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 200,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      _anasayfaBloc.pageSink.add(3);
                      _anasayfaBloc.mekanIdSink
                          .add(_anasayfaBloc.mekanlar[index].id);
                    },
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            _anasayfaBloc.mekanlar[index].thumb,
                            fit: BoxFit.fill,
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
                              splashColor: Colors.blue,
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            left: 2,
                            right: 2,
                            child: Text(
                              _anasayfaBloc.mekanlar[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 2,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KesfetAnasayfaRotalar extends StatefulWidget {
  @override
  _KesfetAnasayfaRotalarState createState() => _KesfetAnasayfaRotalarState();
}

class _KesfetAnasayfaRotalarState extends State<KesfetAnasayfaRotalar> {
  AnasayfaBloc _anasayfaBloc;
  var _mySelection;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rotalar',
              style: TextStyle(fontSize: 24),
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.all(0.0),
              children: [
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bursa'nın doğal ve kültürel"),
                  GestureDetector(
                    child: Text(
                      "detay...",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                    ),
                    onTap: () {
                      _anasayfaBloc.pageSink.add(1);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _anasayfaBloc.kategoriler.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 200,
                  width: 150,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          _anasayfaBloc.kategoriler[index].thumb,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 7,
                          right: 3,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/icons/favorite.png',
                            ),
                            onPressed: () => {print("favorite.png")},
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 2,
                          right: 2,
                          child: Text(
                            _anasayfaBloc.kategoriler[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 2,
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
