import 'package:adonanku_frontend/helper/katinfo_helper.dart';
import 'package:flutter/material.dart';

class KatInfoWidget extends StatelessWidget {
  final KatInfoHelper katInfo;

  const KatInfoWidget({required this.katInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: katInfo.marright),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: 180,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25), topLeft: Radius.circular(25)),
          border: Border.all(
            color: Color(0xFF929292),
            width: 0.5,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: katInfo.warnabg,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Icon(
                        iconMap[katInfo.iconKat] ?? Icons.help,
                        size: 18,
                      ),
                    ),
                    Text(
                      '${katInfo.angka}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0), // Kalau mau ada jarak
                child: Text(
                  katInfo.label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
