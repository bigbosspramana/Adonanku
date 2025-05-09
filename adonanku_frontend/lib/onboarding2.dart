import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  State<OnBoarding2Page> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnBoarding2Page> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.75, // atau 0.7 kalau mau lebih rapat
            child: PageView(
              controller: _controller,
              children: const [
                OnboardingPage(
                  image: 'assets/img/boarding3.png',
                  title: 'Selamat Datang!',
                  description:
                      'Kamu dapat mengatur sistem inventori dengan lebih baik & nyaman!',
                ),
                OnboardingPage(
                  image: 'assets/img/boarding4.png',
                  title: 'Pantau Stok',
                  description:
                      'Temukan berbagai macam resep yang populer dan tambahkan resepmu sendiri!',
                ),
                OnboardingPage(
                  image: 'assets/img/boarding5.png',
                  title: 'Sistem Inventori',
                  description:
                      'Konversikan bahan kue yang kamu miliki menjadi sebuah resep utuh yang kamu butuh!',
                ),
              ],
            ),
          ),

          // Tombol Lanjut hanya muncul di halaman ke-3
          if (currentPage == 2)
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           Onboarding2App()), // Changed to HomePage
                // );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200,65), // Panjang tombol mengikuti lebar
                backgroundColor:
                    Color(0xFFCD8636), // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol // Padding dalam tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), bottomRight: Radius.circular(40)), // Radius sudut tombol
                ),
              ),
              child: Text(
                "Lanjut",
                style: TextStyle(fontSize: 20),
              ),
            )
          else
            Container(
              margin: EdgeInsets.only(top: 17),
              child: TextButton(
                onPressed: () {
                  int nextPage = _controller.page!.toInt() + 1;
                  if (nextPage < 3) {
                    _controller.animateToPage(
                      nextPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color(0xFFCD8636),
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 130),
        child: Column(
          children: [
            Image.asset(
              image,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 350,
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
