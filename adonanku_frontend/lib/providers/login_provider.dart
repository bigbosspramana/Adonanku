import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/viewmodels/login_viewmodel.dart';

final loginProvider =
    AsyncNotifierProvider<LoginViewModel, String?>(LoginViewModel.new);
