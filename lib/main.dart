import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/tabs_screen.dart';
import 'package:ikhsanproject/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'screen/auth_screen.dart';
import './providers/auth.dart';
import 'screen/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angkringan Andhiga',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 6, 20, 111),
      ),
      home: const MyHomePage(title: 'Angkringan Andhiga'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
        ],
        child: const MaterialApp(
          home: AuthScreen(),
        ));
  }
}
