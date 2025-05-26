import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFF11695B),
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
              ),
            ],
          )),
        ));
  }
}
