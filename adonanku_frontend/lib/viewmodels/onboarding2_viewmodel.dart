import '../helper/onboarding_helper.dart';

class OnboardingViewModel {
  List<OnboardingItem> getOnboardingItems() {
    return [
      OnboardingItem(
        image: 'assets/img/boarding3.webp',
        title: 'Sistem Inventori',
        description: 'Kamu dapat mengatur sistem inventori dengan lebih baik & nyaman!',
      ),
      OnboardingItem(
        image: 'assets/img/boarding4.webp',
        title: 'Resep Populer',
        description: 'Temukan berbagai macam resep yang populer dan tambahkan resepmu sendiri!',
      ),
      OnboardingItem(
        image: 'assets/img/boarding5.webp',
        title: 'Konversi Bahan',
        description: 'Konversikan bahan kue yang kamu miliki menjadi sebuah resep utuh yang kamu butuh!',
      ),
    ];
  }
}
