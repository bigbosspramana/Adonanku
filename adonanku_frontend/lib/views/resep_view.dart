import 'package:adonanku_frontend/helper/katbutton_helper.dart';
import 'package:adonanku_frontend/helper/resepcard_helper.dart';
import 'package:adonanku_frontend/views/dashboard_view.dart';
import 'package:adonanku_frontend/widgets/btnPlus_sticky.dart';
import 'package:adonanku_frontend/widgets/kategori_button.dart';
import 'package:adonanku_frontend/widgets/resep_card.dart';
import 'package:adonanku_frontend/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ResepPage extends ConsumerWidget {
  const ResepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 125,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCD8636),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                padding: EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Resep',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 25),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardPage()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 20, top: 25),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFCD8636),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                border: Border.all(
                                  color: const Color(0xFFBABABA),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FontAwesomeIcons.book,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Resep Saya',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KategoriButton(
                              katbutton: KatButtonModel(
                                  label: 'Kue Kukus',
                                  iconKat: Image.asset(
                                    'assets/img/kukus.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  brbLeft: 20,
                                  brbRight: 0,
                                  brtLeft: 0,
                                  brtRight: 20,
                                  warnabg: Color(0xFFCD8636),
                                  size: 12.0,
                                  warnatxt: Colors.white,
                                  mr: 12),
                              key: Key('inventori'),
                              onPressed: () {
                                context.pushNamed('inventory');
                              },
                            ),
                            KategoriButton(
                              katbutton: KatButtonModel(
                                  label: 'Kue Basah',
                                  iconKat: Image.asset(
                                    'assets/img/basah.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  brbLeft: 0,
                                  brbRight: 20,
                                  brtLeft: 20,
                                  brtRight: 0,
                                  warnabg: Color(0xFFCD8636),
                                  size: 12.0,
                                  warnatxt: Colors.white,
                                  mr: 12),
                              key: Key('resep'),
                              onPressed: () {
                                context.pushNamed('resep');
                              },
                            ),
                            KategoriButton(
                              katbutton: KatButtonModel(
                                  label: 'Kue Kering',
                                  iconKat: Image.asset(
                                    'assets/img/kering.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  brbLeft: 20,
                                  brbRight: 0,
                                  brtLeft: 0,
                                  brtRight: 20,
                                  warnabg: Color(0xFFCD8636),
                                  size: 12.0,
                                  warnatxt: Colors.white,
                                  mr: 0),
                              key: Key('konversi'),
                              onPressed: () {
                                context.pushNamed('resep');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Rekomendasi Resep untuk kamu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.only(top: 15),
                  child: ListView.builder(
                    itemCount: resepList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final resep = resepList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ResepCard(cardResep: resep),
                      );
                    },
                  ),
                )
              ],
            ),
            Positioned(
              top: 70,
              left: 10,
              right: 10,
              child: SearchButton(text: 'Cari resep kamu..'),
            )
          ],
        )),
      ),
      floatingActionButton: PlusButton(
        warnaBtn: Color(0xFFCD8636), // warna custom
        onPressed: () {
          // aksi saat tombol ditekan
          print('Floating button ditekan');
        },
      ),
    );
  }
}
