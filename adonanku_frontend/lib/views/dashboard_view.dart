import 'package:adonanku_frontend/helper/katbutton_helper.dart';
import 'package:adonanku_frontend/helper/notif_helper.dart';
import 'package:adonanku_frontend/providers/dashboard_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:adonanku_frontend/widgets/kategori_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:adonanku_frontend/helper/bahancard_helper.dart';
import 'package:adonanku_frontend/widgets/bahan_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ref.read(dashboardViewModelProvider).scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(dashboardViewModelProvider);

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFCD8636),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Pengaturan'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        key: const Key('dashboardPage'),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SingleChildScrollView(
                controller: vm.scrollController,
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
                            'assets/img/dash1.webp',
                            width: 350,
                            cacheWidth:
                                700, // Cache dengan width 2x untuk retina
                            filterQuality: FilterQuality.medium,
                          )),
                          Positioned(
                            child: Image.asset(
                              'assets/img/dash2.webp',
                              cacheWidth: 300,
                              filterQuality: FilterQuality.medium,
                            ),
                            top: 90,
                            right: 0,
                          ),
                          Positioned(
                            child: Image.asset(
                              'assets/img/dash3.webp',
                              cacheWidth: 300,
                              filterQuality: FilterQuality.medium,
                            ),
                            top: 90,
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
                                      'Selamat datang, Kevin',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
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
                                        'assets/img/kat1.webp',
                                        width: 40,
                                        height: 40,
                                        cacheWidth: 80,
                                        filterQuality: FilterQuality.medium,
                                      ),
                                      brbLeft: 20,
                                      brbRight: 0,
                                      brtLeft: 0,
                                      brtRight: 20,
                                      warnabg: Colors.white,
                                      size: 14.0,
                                      warnatxt: Colors.black,
                                      mr: 12),
                                  key: Key('inventori'),
                                  onPressed: () {
                                    context.pushNamed('inventory');
                                  },
                                ),
                                KategoriButton(
                                  katbutton: KatButtonModel(
                                      label: '  Resep  ',
                                      iconKat: Image.asset(
                                        'assets/img/kat2.webp',
                                        width: 40,
                                        height: 40,
                                        cacheWidth: 80,
                                        filterQuality: FilterQuality.medium,
                                      ),
                                      brbLeft: 0,
                                      brbRight: 20,
                                      brtLeft: 20,
                                      brtRight: 0,
                                      warnabg: Colors.white,
                                      size: 14.0,
                                      warnatxt: Colors.black,
                                      mr: 12),
                                  key: Key('resep'),
                                  onPressed: () {
                                    context.pushNamed('resep');
                                  },
                                ),
                                KategoriButton(
                                  katbutton: KatButtonModel(
                                      label: 'Konversi',
                                      iconKat: Image.asset(
                                        'assets/img/kat3.webp',
                                        width: 40,
                                        height: 40,
                                        cacheWidth: 80,
                                        filterQuality: FilterQuality.medium,
                                      ),
                                      brbLeft: 20,
                                      brbRight: 0,
                                      brtLeft: 0,
                                      brtRight: 20,
                                      warnabg: Colors.white,
                                      size: 14.0,
                                      warnatxt: Colors.black,
                                      mr: 0),
                                  key: Key('konversi'),
                                  onPressed: () {
                                    context.pushNamed('konversi');
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
            Positioned(
              top: 50,
              left: 20,
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(
                    FontAwesomeIcons.bars,
                    size: 26,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 40,
                left: 55,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/img/logo.webp',
                      width: 45,
                      cacheWidth: 90,
                      filterQuality: FilterQuality.medium,
                    ),
                    Container(
                      child: Text(
                        'AdonanKu',
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFCD8636)),
                      ),
                    )
                  ],
                )),
            Positioned(
              top: 50,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed('notifikasi');
                },
                child: Stack(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidBell,
                      color: Color(0xFFCD8636),
                      size: 24,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          notifList.length.toString(),
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
            )
          ],
        ));
  }
}
