import 'package:adonanku_frontend/viewmodels/dashboard_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModelProvider =
    ChangeNotifierProvider((ref) => DashboardViewModel());
