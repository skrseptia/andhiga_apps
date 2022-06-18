import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/home.dart';
import 'package:ikhsanproject/widgets/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'screen/authscreen/auth_screen.dart';
import './providers/auth.dart';
import 'screen/menu/dashboard/listmenu.dart';
import 'screen/menu/account.dart';

import './providers/items.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angkringan Andhiga',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 6, 20, 111),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(create: ((context) => Items())),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          TabsScreen.routeName: (ctx) => const TabsScreen(),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
          Dashboard.routeName: (ctx) => const Dashboard(),
          Profil.routeName: (ctx) => const Profil(),
        },
      ),
    );
  }
}
