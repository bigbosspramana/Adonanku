import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'onboarding1.dart';
// import 'login.dart';

class Onboarding2App extends StatelessWidget {
  const Onboarding2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
          fontFamily: 'RadioCanada'),
      home: const OnBoarding2Page(title: 'Adonanku'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoarding2Page extends StatefulWidget {
  const OnBoarding2Page({super.key, required this.title});

  final String title;

  @override
  State<OnBoarding2Page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OnBoarding2Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideLeft;
  late Animation<Offset> _slideRight;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    
    _slideLeft = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideRight = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeIn = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(top: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      FadeTransition(
                        opacity: _fadeIn,
                        child: SlideTransition(
                          position: _slideLeft,
                          child: Image.asset('assets/img/boarding3.png'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Selamat Datang',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 310,
                          child: Text(
                            'Kami dapat membantu anda dalam mengatur sistem pembuatan kue anda',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Onboarding1App()), // Changed to HomePage
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  200, 65), // Panjang tombol mengikuti lebar
                              backgroundColor: Color(
                                  0xFFCD8636), // Warna latar belakang tombol
                              foregroundColor:
                                  Colors.white, // Warna teks tombol
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15), // Padding dalam tombol
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        40)), // Radius sudut tombol
                              ),
                            ),
                            child: Text(
                              "Masuk",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                ],
              ))),
    );
  }
}
