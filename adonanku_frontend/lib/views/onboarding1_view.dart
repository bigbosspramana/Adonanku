import 'package:flutter/material.dart';
import 'package:adonanku_frontend/viewmodels/onboarding1_viewmodel.dart';
import 'package:go_router/go_router.dart';

class Onboarding1View extends StatefulWidget {
  const Onboarding1View({super.key});

  @override
  State<Onboarding1View> createState() => _Onboarding1ViewState();
}

class _Onboarding1ViewState extends State<Onboarding1View>
    with SingleTickerProviderStateMixin {
  late Onboarding1ViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Onboarding1ViewModel();
    viewModel.init(this);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FadeTransition(
                    opacity: viewModel.fadeIn,
                    child: SlideTransition(
                        position: viewModel.slideLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 62),
                          child: Image.asset('assets/img/boarding1.png'),
                        )),
                  ),
                  FadeTransition(
                    opacity: viewModel.fadeIn,
                    child: SlideTransition(
                      position: viewModel.slideRight,
                      child: Image.asset('assets/img/boarding2.png'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Selamat Datang',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Kami dapat membantu anda dalam mengatur sistem pembuatan kue anda',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed(
                          'onboarding2');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      backgroundColor: const Color(0xFFCD8636),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                        ),
                      ),
                    ),
                    child: const Text("Mulai", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
