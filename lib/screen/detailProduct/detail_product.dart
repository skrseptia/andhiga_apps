import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Slider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  List<String> images = [
    "https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/v1622207103/Indonesian-Food-Main/Indonesian-Food-Main.jpg",
    "https://cdn-image.hipwee.com/wp-content/uploads/2018/05/hipwee-8301162_20170531121322.png",
    "https://www.mauryregional.com/media/BlogImages/LQ%20Mint%20Iced%20Tea.jpg",
    "https://ik.imagekit.io/10tn5i0v1n/article/21b7630cb3e676164b208ff6c4bc41f1.jpeg"
  ];

  late int activePage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: images.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, pagePosition) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Image.network(images[pagePosition]),
          );
        });
  }
}
