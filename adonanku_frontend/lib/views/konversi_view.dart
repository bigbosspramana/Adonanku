import 'package:adonanku_frontend/helper/filter_helper.dart';
import 'package:adonanku_frontend/helper/resepnkonversicard_helper.dart';
import 'package:adonanku_frontend/views/dashboard_view.dart';
import 'package:adonanku_frontend/widgets/btnPlus_sticky.dart';
import 'package:adonanku_frontend/widgets/filter_widget.dart';
import 'package:adonanku_frontend/widgets/konversi_card.dart';
import 'package:adonanku_frontend/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KonversiPage extends ConsumerWidget {
  const KonversiPage({super.key});

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
                    color: Color(0xFFFFCC83),
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
                                'Konversi',
                                style: TextStyle(
                                    color: Colors.black,
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
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                    color: Color(0xFF929292), // Warna border
                                    width: 0.5, // Ketebalan border
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/img/filter.png',
                                  width: 18,
                                  height: 18,
                                )),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    FilterWidget(
                                        filter: FilterHelper(
                                            nama: 'Kue Basah', marright: 5)),
                                    FilterWidget(
                                        filter: FilterHelper(
                                            nama: 'Kue Kering', marright: 5)),
                                    FilterWidget(
                                        filter: FilterHelper(
                                            nama: 'Kue Kukus', marright: 5)),
                                  ],
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
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Hasil Konversi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.builder(
                    itemCount: konversiList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final konversi = konversiList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: KonversiCard(cardKonversi: konversi),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: 70,
              left: 10,
              right: 10,
              child: SearchButton(text: 'Cari hasil konversimu..'),
            )
          ],
        )),
      ),
      floatingActionButton: PlusButton(
        warnaBtn: Color(0xFFFFCC83),
        onPressed: () {
          // aksi saat tombol ditekan
          print('Floating button ditekan');
        },
      ),
    );
  }
}
