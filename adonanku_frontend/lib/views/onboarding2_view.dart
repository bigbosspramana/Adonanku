import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:adonanku_frontend/views/login_view.dart';
import 'package:adonanku_frontend/viewmodels/onboarding2_viewmodel.dart';
import 'package:adonanku_frontend/widgets/onboarding2_widget.dart';

class OnBoarding2Page extends StatefulWidget {
  const OnBoarding2Page({super.key});

  @override
  State<OnBoarding2Page> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnBoarding2Page> {
  final PageController _controller = PageController();
  final onboardingItems = OnboardingViewModel().getOnboardingItems();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 65),
                    backgroundColor: Color(0xFFCD8636),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  child: Text("Lanjut", style: TextStyle(fontSize: 20)),
                )
              : TextButton(
                  onPressed: () {
                    if (currentPage < onboardingItems.length - 1) {
                      _controller.animateToPage(
                        currentPage + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text("Skip",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
          Container(
            margin: EdgeInsets.only(bottom: 100, top: 40),
            child: SmoothPageIndicator(
              controller: _controller,
              count: onboardingItems.length,
              effect: WormEffect(
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
