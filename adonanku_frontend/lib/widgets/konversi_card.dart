import 'package:adonanku_frontend/helper/resepnkonversicard_helper.dart';
import 'package:flutter/material.dart';

class KonversiCard extends StatelessWidget {
  final ResepnKonversiCardModel cardKonversi;

  const KonversiCard({required this.cardKonversi, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          border: Border.all(
            color: const Color(0xFFBABABA),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.image, color: Colors.white60),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    cardKonversi.namaResep,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4),
                            child: Icon(Icons.timer, size: 20),
                          ),
                          Text('${cardKonversi.waktuResep} menit'),
                        ],
                      ),
                    ),
                    Text('|'),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Image.asset(
                            cardKonversi.jenisIconResep,
                            width: 20,
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(cardKonversi.jenisResep),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
