---
status: Accepted
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Medium
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-03: Backend Integration Strategy 

## Context
Aplikasi Adonanku membutuhkan koneksi ke backend untuk menyimpan, mengambil, dan memperbarui data seperti stok bahan, resep, dan status kadaluarsa. Untuk itu, kami perlu memilih cara integrasi yang tepat antara tampilan aplikasi dan penyimpanan data di belakang layar. Beberapa pilihan yang dipertimbangkan adalah RESTful API, GraphQL, dan layanan Backend-as-a-Service seperti Firebase. Pilihan ini akan mempengaruhi kecepatan pengembangan aplikasi, fleksibilitas pengelolaan data, serta performa secara keseluruhan.

## Decision
Kami memilih menggunakan RESTful API karena framework backend yang kami gunakan adalah Laravel, yang mendukung implementasi REST dengan sangat baik. Laravel menyediakan fitur-fitur bawaan seperti routing, controller, dan resource yang memudahkan dalam pembuatan API. Dengan pendekatan REST ini, aplikasi Adonanku dapat dengan mudah mengirim dan menerima data seperti bahan, resep, dan status stok. Selain itu, REST memungkinkan pengembangan frontend dan backend dilakukan secara terpisah namun tetap saling terhubung dengan efisien.

## Alternatives
1. **GraphQL** <br>
    Lebih fleksibel dalam melakukan query data karena klien dapat memilih data yang dibutuhkan. Namun, saat ini belum sepenuhnya dikuasai oleh tim dan memerlukan pengaturan tambahan di Laravel. Penggunaan GraphQL pada tahap awal pengembangan juga berisiko menyebabkan over-engineering.

## Consequences
### ✅ Good:
- Mudah dipahami dan digunakan karena REST memakai prinsip HTTP standar seperti GET, POST, PUT, dan DELETE yang umum dikenal oleh banyak developer
- Memisahkan frontend dan backend dengan baik sehingga keduanya bisa dikembangkan secara mandiri dan paralel
- Cocok untuk struktur data sederhana yang dibutuhkan oleh aplikasi Adonanku seperti daftar bahan, resep, dan status stok
- Mudah diuji dan di-debug karena bersifat stateless dan berbasis HTTP sehingga dapat diuji menggunakan alat seperti Postman

### ❌ Bad:
- Kurang fleksibel untuk permintaan kompleks jika dibandingkan dengan GraphQL dalam mengambil data yang saling terkait atau memiliki struktur yang kompleks
- Dapat menyebabkan over-fetching atau under-fetching karena data yang diterima bisa terlalu banyak atau terlalu sedikit tergantung pada desain endpoint
- Tidak mendukung real-time secara bawaan sehingga memerlukan teknologi tambahan seperti WebSocket jika dibutuhkan komunikasi waktu nyata