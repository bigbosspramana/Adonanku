---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Medium
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-04: Local Data Persistence

## Context
Ketika mengembangkan sebuah aplikasi, terutama pada pengembangan aplikasi mobile. Penyimpanan data lokal merupakan komponen penting untuk memastikan aplikasi tetap dapat berfungsi dengan baik meskipun perangkat sedang dalam kondisi Offline atau memiliki koneksi internet yang tidak stabil. Local data persistence juga penting untuk caching dan menyimpan data penting seperti preferensi pengguna atau hasil sinkronisasi. Beberapa opsi yang umum digunakan di Flutter antara lain SQLite, Hive, Sembast, dan ObjectBox, masing-masing dengan kelebihan dan kekurangannya. Pemilihan solusi yang tepat perlu disesuaikan dengan kebutuhan dan kompleksitas aplikasi.

## Decision
Kami memutuskan untuk menggunakan flutter_secure_storage untuk penyimpanan data sensitif dalam aplikasi Adonanku, karena menyediakan solusi penyimpanan terenkripsi yang aman, ideal untuk data seperti kredensial pengguna, preferensi aplikasi, dan informasi sensitif lainnya.

## Alternatives
1. **SQLite** <br>
    SQLite adalah solusi penyimpanan yang lebih umum digunakan dan cocok untuk menyimpan data dalam format tabel. Ini berguna jika aplikasi membutuhkan struktur data yang lebih kompleks, namun tidak menawarkan tingkat enkripsi yang sama seperti flutter_secure_storage.

## Consequences
### ✅ Good:
- Keamanan lebih tinggi karena flutter_secure_storage menyimpan data dengan enkripsi yang kuat, menjaga data sensitif tetap aman.
- Mudah untuk diintegrasikan dengan aplikasi Flutter, mendukung penyimpanan data sensitif seperti kredensial login, token akses, dan preferensi pengguna.

### ❌ Bad:
- Performa sedikit lebih lambat dibandingkan dengan penyimpanan lokal lainnya seperti SQLite, terutama untuk aplikasi yang menyimpan data dalam jumlah besar.
- Keterbatasan dalam menangani data besar atau data non-sensitif, jika aplikasi membutuhkan penyimpanan data dalam jumlah besar atau query kompleks, menggunakan flutter_secure_storage bisa menjadi kurang efisien dibandingkan dengan SQLite.
