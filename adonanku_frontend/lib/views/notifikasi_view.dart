import 'package:adonanku_frontend/helper/notif_helper.dart';
import 'package:adonanku_frontend/widgets/notif_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NotifikasiPage extends ConsumerWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 80),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.builder(
                    itemCount: notifList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final notif = notifList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: NotifCard(cardNotif: notif),
                      );
                    },
                  ),
              ),
            ),
            Positioned(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF11695B),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(62, 0, 0, 0),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed('dash');
                    },
                    child: Container(
                      child: Icon(FontAwesomeIcons.arrowLeft,
                          size: 20, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Notifikasi',
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
