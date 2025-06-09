import 'package:adonanku_frontend/helper/resepcard_helper.dart';
import 'package:flutter/material.dart';

class ResepCard extends StatelessWidget {
  final ResepCardModel cardResep;

  const ResepCard({required this.cardResep, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Color(0xFF929292)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(0),
              ),
              child: Container(
                width: double.infinity,
                height: 125,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 185, 131, 127)),
              )),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    cardResep.namaResep,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: Icon(Icons.timer, size: 18),
                          ),
                          Text('${cardResep.waktuResep} menit'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: Image.asset(
                              cardResep.jenisIconResep,
                              width: 18,
                              height: 18,
                            ),
                          ),
                          Text(cardResep.jenisResep),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
