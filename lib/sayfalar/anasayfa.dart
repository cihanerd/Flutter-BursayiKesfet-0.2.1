// import 'dart:html';
import 'dart:ui';
import 'package:BursayiKesfet/bloc/anasayfa_bloc.dart';
import 'package:BursayiKesfet/bloc/anasayfa_bloc_provider.dart';
import 'package:BursayiKesfet/bloc/fab_icon_bloc.dart';
import 'package:BursayiKesfet/bloc/fab_icon_bloc_provider.dart';
import 'package:BursayiKesfet/sayfalar/kategoriler_liste.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'bana_ozel.dart';
import 'dahasi.dart';
import 'harita.dart';
import 'kesfet_anasayfa.dart';
import 'secenekler.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  AnasayfaBloc _anasayfaBloc;
  int selectedPage;
  GlobalKey<ConvexAppBarState> _appBarKey = GlobalKey<ConvexAppBarState>();

  FabIkonBloc _fabIkonBloc;

  PageController _pageController = PageController(
    //PageController Başlangıç indexi
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _fabIkonBloc = FabIkonBloc();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anasayfaBloc = AnasayfaBlocProvider.of(context).anasayfaBloc;
  }

  @override
  void dispose() {
    // _anasayfaBloc.dispose();
    // _fabIkonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FabIkonBlocProvider(
      fabIkonBlocc: _fabIkonBloc,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              key: Key("Cihan"),
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                  _appBarKey.currentState.animateTo(
                      page); //Sayfa sağa-sola swipe yapıldığında ConvexAppBar'ın seçili olduğu index'i değiştirir.
                });
              },
              children: <Widget>[
                //PageView içerisinde bulunan sayfalar
                KesfetAnasayfa(),
                BanaOzel(),
                Harita(),
                Secenekler(),
                Dahasi(),
              ],
            ),
            StreamBuilder(
              stream: _fabIkonBloc.fabIkonStream,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                        child: GestureDetector(
                          onTap: () {
                            _fabIkonBloc.fabIkonEkleSinki.add(false);
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Builder(
                builder: (context) {
                  if (selectedPage == null || selectedPage == 0) {
                    return Image(
                      image: AssetImage('assets/icons/Discovery.png'),
                      color: Color.fromARGB(255, 3, 114, 156),
                    );
                  }
                  return Image(
                    image: AssetImage('assets/icons/Discovery.png'),
                  );
                },
              ),
              title: 'Keşfet',
            ),
            TabItem(
                icon: Builder(
                  builder: (context) {
                    if (selectedPage == 1) {
                      return Image(
                        image: AssetImage('assets/icons/Profile.png'),
                        color: Color.fromARGB(255, 3, 114, 156),
                      );
                    }
                    return Image(
                      image: AssetImage('assets/icons/Profile.png'),
                    );
                  },
                ),
                title: 'Bana Özel'),
            TabItem(
                icon: Builder(
                  builder: (context) {
                    if (selectedPage == 2) {
                      return Image(
                        image: AssetImage('assets/icons/Location.png'),
                        color: Color.fromARGB(255, 3, 114, 156),
                      );
                    }
                    return Image(
                      image: AssetImage('assets/icons/Location.png'),
                    );
                  },
                ),
                title: 'Harita'),
            TabItem(
                icon: Builder(
                  builder: (context) {
                    if (selectedPage == 3) {
                      return Image(
                        image: AssetImage('assets/icons/Setting.png'),
                        color: Color.fromARGB(255, 3, 114, 156),
                      );
                    }
                    return Image(
                      image: AssetImage('assets/icons/Setting.png'),
                    );
                  },
                ),
                title: 'Seçenekler'),
            TabItem(
              icon: Builder(
                builder: (context) {
                  if (selectedPage == 4) {
                    return Image(
                      image: AssetImage('assets/icons/More-Circle.png'),
                      color: Color.fromARGB(255, 3, 114, 156),
                    );
                  }
                  return Image(
                    image: AssetImage('assets/icons/More-Circle.png'),
                  );
                },
              ),
              title: 'Dahası',
            ),
          ],
          initialActiveIndex: selectedPage,
          key:
              _appBarKey, //PageView tarafından index'i kontrol edebilmek için GlobalKey tanımlandı.
          onTap: (int i) {
            if (i == 0) {
              _anasayfaBloc.pageSink.add(0);
            }

            //BottomNavigationBar ikonlarına tıklanıldığında PageView animasyonu ile sayfa geçişi sağlanıyor.
            _pageController.animateToPage(i,
                duration: Duration(milliseconds: 200),
                curve: Curves.elasticInOut);
            setState(
              () {
                selectedPage = i;
                _fabIkonBloc.fabIkonEkleSinki.add(false);
              },
            );
          },
          color: Color.fromARGB(255, 77, 77, 77),
          activeColor: Color.fromARGB(255, 3, 114, 156),
          style: TabStyle.fixed,
          backgroundColor: Colors.white,
        ),
        // floatingActionButton: selectedPage == 2 ? null : FabIkon(),
        floatingActionButton: FabIkon(),
      ),
    );
  }
}

class FabIkon extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FabIkon({this.onPressed, this.tooltip, this.icon});

  @override
  _FabIkonState createState() => _FabIkonState();
}

class _FabIkonState extends State<FabIkon> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  FabIkonBloc _fabIkonBloc;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: _fabHeight + 16,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fabIkonBloc = FabIkonBlocProvider.of(context).fabIkonBlocc;
    _fabIkonBloc.fabIkonEkleSinki.add(false);
    animate();
  }

  @override
  dispose() {
    _animationController.dispose();
    _fabIkonBloc.dispose();
    super.dispose();
  }

  animate() {
    _fabIkonBloc.fabIkonStream.listen((event) {
      if (!event) {
        isOpened = false;
        _animationController.reverse();
      } else {
        isOpened = true;
        _animationController.forward();
      }
    });
  }

  Widget marker() {
    return Container(
      padding: EdgeInsets.only(right: 24.0, bottom: 16.0),
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: null,
        tooltip: 'Add',
        child: Image.asset(
          'assets/icons/Location.png',
          color: Colors.white,
          scale: 32,
        ),
        backgroundColor: Color.fromARGB(220, 129, 216, 208),
      ),
    );
  }

  Widget heart() {
    return Container(
      padding: EdgeInsets.only(right: 24.0, bottom: 16.0),
      child: FloatingActionButton(
        heroTag: "btn2",
        onPressed: null,
        tooltip: 'Image',
        child: Image.asset(
          'assets/icons/favorite.png',
          scale: 30,
        ),
        backgroundColor: Color.fromARGB(220, 129, 216, 208),
      ),
    );
  }

  Widget tag() {
    return Container(
      padding: EdgeInsets.only(right: 24.0, bottom: 16.0),
      child: FloatingActionButton(
        heroTag: "btn3",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => KategoriListe()));
        },
        tooltip: 'Inbox',
        child: Image.asset(
          'assets/icons/Bookmark.png',
          scale: 32,
        ),
        backgroundColor: Color.fromARGB(220, 129, 216, 208),
      ),
    );
  }

  Widget toggle() {
    return Container(
      padding: EdgeInsets.only(
        bottom: 28.0,
        right: 24.0,
      ),
      child: AnimatedBuilder(
        animation: _animateIcon,
        child: FloatingActionButton(
          heroTag: "btn4",
          backgroundColor: Color.fromARGB(220, 129, 216, 208),
          onPressed: () {
            isOpened = !isOpened;
            _fabIkonBloc.fabIkonEkleSinki.add(isOpened);

            animate();
          },
          tooltip: 'Toggle',
          child: Icon(
            Icons.add,
            size: 38.0,
          ),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animateIcon.value * 2.28,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: marker(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: heart(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: tag(),
        ),
        toggle(),
      ],
    );
  }
}
