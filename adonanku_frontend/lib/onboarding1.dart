import 'package:adonanku_frontend/onboarding2.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'package:adonanku_frontend/onboarding2.dart';
// import 'login.dart';

class Onboarding1App extends StatelessWidget {
  const Onboarding1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
          fontFamily: 'RadioCanada'),
      home: const OnBoarding1Page(title: 'Adonanku'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoarding1Page extends StatefulWidget {
  const OnBoarding1Page({super.key, required this.title});

  final String title;

  @override
  State<OnBoarding1Page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OnBoarding1Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideLeft;
  late Animation<Offset> _slideRight;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    
    _slideLeft = Tween<Offset>(begin: Offset(-0.3, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideRight = Tween<Offset>(begin: Offset(0.3, 0), end: Offset.zero)
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
                          child: Image.asset('assets/img/boarding1.png'),
                        ),
                      ),
                      SizedBox(width: 62),
                      FadeTransition(
                        opacity: _fadeIn,
                        child: SlideTransition(
                          position: _slideRight,
                          child: Image.asset('assets/img/boarding2.png'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
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
                      margin: EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Onboarding2App()), // Changed to HomePage
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
                              "Mulai",
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
