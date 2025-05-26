import 'package:adonanku_frontend/models/katbutton_model.dart';
import 'package:adonanku_frontend/views/inventory_view.dart';
import 'package:adonanku_frontend/widgets/kategori_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:adonanku_frontend/models/bahancard_model.dart';
import 'package:adonanku_frontend/widgets/bahan_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final viewModel = ref.watch(registerViewModelProvider);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(62, 0, 0, 0),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/img/dash1.png',
                      width: 350,
                    )),
                    Positioned(
                        top: 13,
                        left: 55,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img/logo.png',
                              width: 55,
                            ),
                            Container(
                              child: Text(
                                'AdonanKu',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFCD8636)),
                              ),
                            )
                          ],
                        )),
                    Positioned(
                      child: Image.asset('assets/img/dash2.png'),
                      top: 90,
                      right: 0,
                    ),
                    Positioned(
                      child: Image.asset('assets/img/dash3.png'),
                      top: 90,
                    ),
                    Positioned(
                      child: Icon(FontAwesomeIcons.bars, size: 30),
                      top: 25,
                      left: 20,
                    ),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Selamat Datang, Kevin',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              width: 350,
                              child: Text(
                                'Semoga bahan-bahanmu hari ini cukup untuk semua pesanan!',
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ],
                        )),
                    Positioned(
                      top: 25,
                      right: 25,
                      child: Stack(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidBell,
                            color: Color(0xFFCD8636),
                            size: 28,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Color(0xFFCD8636),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15, left: 15, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KategoriButton(
                            katbutton: KatButtonModel(
                              label: 'Inventori',
                              iconKat: Image.asset(
                                'assets/img/kat1.png',
                                width: 40,
                                height: 40,
                              ),
                              brbLeft: 20,
                              brbRight: 0,
                              brtLeft: 0,
                              brtRight: 20,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InventoryPage()),
                              );
                            },
                          ),
                          KategoriButton(
                            katbutton: KatButtonModel(
                              label: '  Resep  ',
                              iconKat: Image.asset(
                                'assets/img/kat2.png',
                                width: 40,
                                height: 40,
                              ),
                              brbLeft: 0,
                              brbRight: 20,
                              brtLeft: 20,
                              brtRight: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InventoryPage()),
                              );
                            },
                          ),
                          KategoriButton(
                            katbutton: KatButtonModel(
                              label: 'Konversi',
                              iconKat: Image.asset(
                                'assets/img/kat3.png',
                                width: 40,
                                height: 40,
                              ),
                              brbLeft: 20,
                              brbRight: 0,
                              brtLeft: 0,
                              brtRight: 20,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InventoryPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Segera Kadaluwarsa',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ListView.builder(
                        itemCount: bahanList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final bahan = bahanList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: BahanCard(cardBahan: bahan),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
