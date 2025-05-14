import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/viewmodels/login_viewmodel.dart';

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  return LoginViewModel();
});
