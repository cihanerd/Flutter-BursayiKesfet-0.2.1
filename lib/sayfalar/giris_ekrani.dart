import 'package:flutter/material.dart';

class GirisEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimasyonluResim(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height * 0.3),
              SizedBox(
                height: size.height * 0.13,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AnimasyonluText(),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: AnimasyonluLogo(),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                  height: size.height * 0.13,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: AnimasyonluText2(),
                  )),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AnimasyonluResim extends StatefulWidget {
  @override
  _AnimasyonluResimState createState() => _AnimasyonluResimState();
}

class _AnimasyonluResimState extends State<AnimasyonluResim>
    with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: 3000,
      ),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animasyon = Tween(begin: 2.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    return AnimatedBuilder(
      animation: animasyon,
      child: Image.asset(
        "assets/images/muradiyecami.jpg",
        fit: BoxFit.fill,
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: animasyon.value,
          child: child,
        );
      },
    );
  }
}

class AnimasyonluLogo extends StatefulWidget {
  @override
  _AnimasyonluLogoState createState() => _AnimasyonluLogoState();
}

class _AnimasyonluLogoState extends State<AnimasyonluLogo>
    with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: 3000,
      ),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animasyon = Tween(begin: 1.0, end: 1.5).animate(controller);

    return AnimatedBuilder(
      animation: animasyon,
      child: Container(
        child: Image.asset(
          "assets/images/logobeyaz.png",
          fit: BoxFit.fill,
        ),
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: animasyon.value,
          child: child,
        );
      },
    );
  }
}

class AnimasyonluText extends StatefulWidget {
  @override
  _AnimasyonluTextState createState() => _AnimasyonluTextState();
}

class _AnimasyonluTextState extends State<AnimasyonluText>
    with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: 5000,
      ),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final soldurma = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(curve: Curves.ease, parent: controller));
    return AnimatedBuilder(
      animation: soldurma,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tüm zamanların",
            style: TextStyle(
                color: Colors.white,
                fontSize: 56,
                decoration: TextDecoration.none,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "en güzel şehri",
            style: TextStyle(
                color: Colors.white,
                fontSize: 56,
                decoration: TextDecoration.none,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      builder: (context, child) {
        return Opacity(
          opacity: soldurma.value,
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}

class AnimasyonluText2 extends StatefulWidget {
  @override
  _AnimasyonluText2State createState() => _AnimasyonluText2State();
}

class _AnimasyonluText2State extends State<AnimasyonluText2>
    with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: 3000,
      ),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final soldurma = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));
    return AnimatedBuilder(
      animation: soldurma,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Keşfetmen için",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "seni bekliyor...",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      builder: (context, child) {
        return Opacity(
          opacity: soldurma.value,
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}
