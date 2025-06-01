import 'package:adonanku_frontend/models/custombutton_helper.dart';
import 'package:adonanku_frontend/models/datacard_helper.dart';
import 'package:adonanku_frontend/views/login_view.dart';
import 'package:adonanku_frontend/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:adonanku_frontend/providers/regist_provider.dart';
import 'package:adonanku_frontend/widgets/data_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(registerViewModelProvider);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Anda',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        'Sudah',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        'Memiliki akun?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 25, child: Image.asset('assets/img/registasset.png')),
                Positioned(
                  top: 40,
                  right: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF9BF51),
                      foregroundColor: Colors.black,
                      fixedSize: Size(110, 70),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    child: Text('Login'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 220, left: 20, right: 20, bottom: 40),
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          border: Border.all(
                            color: Color(0xFFBABABA),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Daftar',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3A2216)),
                            ),
                            const Text(
                              'Silahkan lengkapi informasi dibawah ini',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3A2216)),
                            ),
                            const SizedBox(height: 25),
                            WidgetCard(
                              card: DataKartu(
                                title: 'none',
                                icon: 'profile',
                                placeholder: 'Masukkan nama lengkap',
                                controller: viewModel.nameController,
                              ),
                            ),
                            WidgetCard(
                              card: DataKartu(
                                title: 'none',
                                icon: 'username',
                                placeholder: 'Masukkan username',
                                controller: viewModel.usernameController,
                              ),
                            ),
                            WidgetCard(
                              card: DataKartu(
                                title: 'none',
                                icon: 'email',
                                placeholder: 'Masukkan email',
                                controller: viewModel.emailController,
                              ),
                            ),
                            WidgetCard(
                              card: DataKartu(
                                title: 'none',
                                icon: 'pass',
                                placeholder: 'Masukkan password',
                                controller: viewModel.passwordController,
                                obscureText: true,
                              ),
                            ),
                            WidgetCard(
                              card: DataKartu(
                                title: 'none',
                                icon: 'confirmpass',
                                placeholder: 'Konfirmasi password',
                                controller:
                                    viewModel.passwordConfirmationController,
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: viewModel.toggleCheckbox,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: viewModel.isChecked
                                          ? const Color(0xFF3A2216)
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: const Color(0xFF3A2216)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: viewModel.isChecked
                                        ? const Icon(Icons.check,
                                            size: 18.0, color: Colors.white)
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Saya menyetujui ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      children: const [
                                        TextSpan(
                                            text: 'Syarat & Ketentuan Pengguna',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(text: ' dan '),
                                        TextSpan(
                                            text: 'Kebijakan Privasi',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(text: ' yang berlaku.'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: CustomButton(
                                  buttonData: ButtonData(
                                    text: 'Daftar',
                                    backgroundColor: Color(0xFFCD8636),
                                    size: Size(220, 70),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final errorMessage =
                                        await viewModel.register();
                                    if (errorMessage == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Registrasi berhasil')),
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text(errorMessage)),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
