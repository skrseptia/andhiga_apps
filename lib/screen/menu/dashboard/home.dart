import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/listmenu.dart';
import 'package:ikhsanproject/screen/menu/dashboard/slidermenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SliderMenu(),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const Scaffold(
    body: Dashboard(),
  );
}
