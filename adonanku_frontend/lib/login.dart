import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'homePanti.dart'; // Changed import to homePanti.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
          fontFamily: 'RadioCanada'),
      home: const LoginPage(title: 'Adonanku'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 70,
              right: 30,
              child: Transform.rotate(
                angle: pi / 4, // 90 derajat
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anda belum',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 4.0),
                            blurRadius: 4.8,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Memiliki',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 4.0),
                            blurRadius: 4.8,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Akun?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 4.0),
                            blurRadius: 4.8,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: -10,
                child: Image.asset('assets/img/loginasset3.png')),
            Positioned(
                top: 220,
                right: 0,
                left: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => RegisterPage()),
                      // );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(62, 0, 0, 0),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, -1),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A2216),
                            ),
                          ),
                        ),
                        Form(
                          title: 'Username atau Email',
                          icon: 'profile',
                          placeholder: 'Masukkan username atau email',
                        ),
                        Form(
                          title: 'Password',
                          icon: 'pass',
                          placeholder: 'Masukkan password',
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: isChecked
                                          ? Color(0xFF3A2216)
                                          : Colors.transparent,
                                      border:
                                          Border.all(color: Color(0xFF3A2216)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: isChecked
                                        ? Icon(Icons.check,
                                            size: 18.0, color: Colors.white)
                                        : null,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Saya menyetujui ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: 'Syarat & Ketentuan Pengguna',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      TextSpan(text: ' dan '),
                                      TextSpan(
                                        text: 'Kebijakan Privasi',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      TextSpan(text: ' yang berlaku.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 80, top: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginApp()), // Changed to HomePage
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    250, 65), // Panjang tombol mengikuti lebar
                                backgroundColor: Color(
                                    0xFFCD8636), // Warna latar belakang tombol
                                foregroundColor: Colors
                                    .white, // Warna teks tombol // Padding dalam tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(
                                          40)), // Radius sudut tombol
                                ),
                                elevation: 5,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      child: Image.asset('assets/img/loginasset.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      child: Image.asset('assets/img/loginasset1.png'),
                    ),
                  ),
                ],
              )),
            )
          ],
        )));
  }
}

class Form extends StatelessWidget {
  final String title;
  final String icon;
  final String placeholder;

  const Form({
    required this.title,
    required this.icon,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> iconMap = {
      'profile': FontAwesomeIcons.solidUser,
      'pass': FontAwesomeIcons.key,
    };

    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3A2216),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFBABABA))),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Icon(
                        iconMap[icon],
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: placeholder,
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    ));
  }
}
