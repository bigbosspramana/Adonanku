import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  bool showOverlayHeader = false;

  DashboardViewModel() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset > 160 && !showOverlayHeader) {
      showOverlayHeader = true;
      notifyListeners();
    } else if (scrollController.offset <= 160 && showOverlayHeader) {
      showOverlayHeader = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

