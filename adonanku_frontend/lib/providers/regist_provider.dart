import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/viewmodels/regist_viewmodel.dart';

final registerViewModelProvider = ChangeNotifierProvider<RegisterViewModel>((ref) {
  return RegisterViewModel();
});
