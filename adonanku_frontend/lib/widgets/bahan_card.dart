import 'package:adonanku_frontend/models/bahancard_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BahanCard extends StatelessWidget {
  final BahanCardModel cardBahan;

  const BahanCard({required this.cardBahan, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xFF929292)),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xFF929292)),
                ),
              ),
              Container(
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              cardBahan.namaBahan,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF11695B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                '${cardBahan.jumlahSatuanBahan} ${cardBahan.satuanBahan}',
                                style: TextStyle(color: Color(0xFFEDE6D4)),
                              ),
                            )
                          ],
                        ),
                        Text(
                            '${cardBahan.jumlahBahan} ${cardBahan.jenisSatuanBahan}'),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            FontAwesomeIcons.calendarDay,
                            size: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            DateFormat('dd/MM/yyyy')
                                .format(cardBahan.expireDate),
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: const Color(0xFFCD8636),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  FontAwesomeIcons.pen,
                  size: 13,
                  color: Color.fromARGB(255, 254, 254, 254),
                ),
              ))
        ],
      ),
    );
  }
}
