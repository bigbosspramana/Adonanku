import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/bahan_viewmodel.dart';

final bahanViewModelProvider = ChangeNotifierProvider<BahanViewModel>(
  (ref) => BahanViewModel(),
);
