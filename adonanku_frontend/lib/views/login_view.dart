import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/providers/login_provider.dart';
import 'dart:math';
import 'package:adonanku_frontend/widgets/data_card.dart';
import 'package:adonanku_frontend/helper/datacard_helper.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);

    return Scaffold(
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
                      context.pushNamed('register');
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
                        WidgetCard(
                          card: DataKartu(
                            title: 'Username atau Email',
                            icon: 'profile',
                            placeholder: 'Masukkan username atau email',
                            controller: viewModel.usernameController,
                          ),
                          fieldKey: Key('usernameField'),
                        ),
                        WidgetCard(
                            card: DataKartu(
                          title: 'Password',
                          icon: 'pass',
                          placeholder: 'Masukkan password',
                          controller: viewModel.passwordController,
                          obscureText: true,
                        ),
                        fieldKey: Key('passField'),),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                key: const Key('customCheckbox'),
                                margin: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () => viewModel.toggleCheckbox(),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: viewModel.isChecked
                                          ? Color(0xFF3A2216)
                                          : Colors.transparent,
                                      border:
                                          Border.all(color: Color(0xFF3A2216)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: viewModel.isChecked
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
                              key: const Key('loginButton'),
                              onPressed: () async {
                                final success = await viewModel.login();
                                if (success) {
                                  if (context.mounted) {
                                    context.goNamed('dash');
                                  }
                                } else {
                                  final error = ref.read(loginProvider).value;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(error ?? 'Login gagal')),
                                  );
                                }
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
                              child: state.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
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
        ),
      ),
    );
  }
}
