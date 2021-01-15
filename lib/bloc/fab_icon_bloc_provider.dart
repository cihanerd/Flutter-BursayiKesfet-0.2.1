import 'package:flutter/material.dart';

import 'fab_icon_bloc.dart';

class FabIkonBlocProvider extends InheritedWidget {
  final FabIkonBloc fabIkonBlocc;
  const FabIkonBlocProvider({Key key, Widget child, this.fabIkonBlocc})
      : super(child: child, key: key);
  static FabIkonBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(FabIkonBlocProvider oldWidget) {
    return (fabIkonBlocc != oldWidget.fabIkonBlocc);
  }
}
