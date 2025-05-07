---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Flutter Documentation
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-07: Theming & UI Styling

## Context
Dalam pengembangan aplikasi Adonanku, pemilihan tema dan styling UI sangat penting untuk memastikan tampilan konsisten di Android dan iOS. Menggunakan Material Design untuk Android dan Cupertino Design untuk iOS bisa jadi solusi praktis, sementara sistem desain kustom memberikan fleksibilitas lebih untuk penyesuaian. Pilihan yang tepat akan mendukung pengalaman pengguna yang lancar dan memudahkan pengembangan fitur baru.

## Decision
Kami memutuskan menggunakan Material Design Karena pengujian aplikasi saat ini lebih berfokus pada Android, Pendekatan ini akan mempermudah pengelolaan antarmuka dan mempercepat pengujian, karena Material Design sudah sepenuhnya terintegrasi dengan Flutter dan sangat optimal untuk platform Android.

## Alternatives
1. **Cupertino** <br>
    Meskipun pilihan ini sangat baik untuk pengguna iOS, fokus pengujian kali ini lebih pada Android, sehingga penggunaan Cupertino akan dipertimbangkan lebih lanjut untuk pengembangan di iOS di masa depan.

## Consequences
### ✅ Good:
- Konsistensi desain antarkomponen dengan dukungan penuh dari Flutter.
- Pengalaman pengguna optimal di Android dengan Material Design.
- Pengembangan lebih cepat dan terstruktur pada Android, sesuai fokus pengujian saat ini.

### ❌ Bad:
- Pengalaman pengguna di iOS mungkin kurang optimal selama pengujian kali ini karena fokus pengujian lebih berorientasi pada Android
- Desain yang kurang konsisten di iOS jika hanya mengandalkan Material Design untuk pengujian, mengingat Cupertino Design lebih familiar bagi pengguna iOS.