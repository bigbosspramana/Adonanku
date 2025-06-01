import '../models/onboarding_helper.dart';

class OnboardingViewModel {
  List<OnboardingItem> getOnboardingItems() {
    return [
      OnboardingItem(
        image: 'assets/img/boarding3.png',
        title: 'Selamat Datang!',
        description: 'Kamu dapat mengatur sistem inventori dengan lebih baik & nyaman!',
      ),
      OnboardingItem(
        image: 'assets/img/boarding4.png',
        title: 'Pantau Stok',
        description: 'Temukan berbagai macam resep yang populer dan tambahkan resepmu sendiri!',
      ),
      OnboardingItem(
        image: 'assets/img/boarding5.png',
        title: 'Sistem Inventori',
        description: 'Konversikan bahan kue yang kamu miliki menjadi sebuah resep utuh yang kamu butuh!',
      ),
    ];
  }
}
