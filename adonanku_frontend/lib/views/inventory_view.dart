import 'package:adonanku_frontend/helper/bahancard_helper.dart';
import 'package:adonanku_frontend/helper/filter_helper.dart';
import 'package:adonanku_frontend/helper/katinfo_helper.dart';
import 'package:adonanku_frontend/views/dashboard_view.dart';
import 'package:adonanku_frontend/widgets/bahan_card.dart';
import 'package:adonanku_frontend/widgets/btnPlus_sticky.dart';
import 'package:adonanku_frontend/widgets/filter_widget.dart';
import 'package:adonanku_frontend/widgets/katinfo_widget.dart';
import 'package:adonanku_frontend/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

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
                    color: Color(0xFF11695B),
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
                                'Inventori',
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
                  margin: EdgeInsets.only(top: 45),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        KatInfoWidget(
                          katInfo: KatInfoHelper(
                              label: 'Stok Habis',
                              iconKat: 'habis',
                              angka: 5,
                              warnabg: Color(0xFFE26969),
                              marright: 0),
                        ),
                        KatInfoWidget(
                          katInfo: KatInfoHelper(
                              label: 'Stok Menipis',
                              iconKat: 'menipis',
                              angka: 5,
                              warnabg: Color(0xFFF7E677),
                              marright: 0),
                        ),
                        KatInfoWidget(
                          katInfo: KatInfoHelper(
                              label: 'Akan Expire',
                              iconKat: 'akankadaluarsa',
                              angka: 5,
                              warnabg: Color(0xFFFF9800),
                              marright: 0),
                        ),
                        KatInfoWidget(
                          katInfo: KatInfoHelper(
                              label: 'Stok Expire',
                              iconKat: 'kadaluarsa',
                              angka: 5,
                              warnabg: Color(0xFF616161),
                              marright: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                      nama: 'Stok Habis', marright: 5)),
                              FilterWidget(
                                  filter: FilterHelper(
                                      nama: 'Stok Menipis', marright: 5)),
                              FilterWidget(
                                  filter: FilterHelper(
                                      nama: 'Stok Akan Kadaluarsa',
                                      marright: 5)),
                              FilterWidget(
                                  filter: FilterHelper(
                                      nama: 'Stok Kadaluarsa', marright: 25)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Bahan-bahan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
            Positioned(
              top: 70,
              left: 10,
              right: 10,
              child: SearchButton(
                text: 'Cari bahan kamu..',
              ),
            )
          ],
        )),
      ),
      floatingActionButton: PlusButton(
        warnaBtn: Color(0xFF11695B), // warna custom
        onPressed: () {
          // aksi saat tombol ditekan
          print('Floating button ditekan');
        },
      ),
    );
  }
}
