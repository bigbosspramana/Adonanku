import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:adonanku_frontend/views/login_view.dart';
import 'package:adonanku_frontend/viewmodels/onboarding2_viewmodel.dart';
import 'package:adonanku_frontend/widgets/onboarding2_widget.dart';

class OnBoarding2Page extends StatefulWidget {
  final PageController? externalController;

  const OnBoarding2Page({super.key, this.externalController});

  @override
  State<OnBoarding2Page> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnBoarding2Page> {
  late final PageController _controller;
  final onboardingItems = OnboardingViewModel().getOnboardingItems();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.externalController ?? PageController();
    _controller.addListener(() {
      if (mounted) {
        setState(() {
          currentPage = _controller.page?.round() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.externalController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingItems.length,
              itemBuilder: (context, index) {
                final item = onboardingItems[index];
                return OnboardingPageWidget(item: item);
              },
            ),
          ),
          currentPage == onboardingItems.length - 1
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 65),
                    backgroundColor: const Color(0xFFCD8636),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  child: const Text("Lanjut", style: TextStyle(fontSize: 20)),
                )
              : TextButton(
                  onPressed: () {
                    if (currentPage < onboardingItems.length - 1) {
                      _controller.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text("Skip",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
          Container(
            margin: const EdgeInsets.only(bottom: 100, top: 40),
            child: SmoothPageIndicator(
              key: const Key('onboardingIndicator'),
              controller: _controller,
              count: onboardingItems.length,
              effect: const WormEffect(
                activeDotColor: Color(0xFFCD8636),
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
