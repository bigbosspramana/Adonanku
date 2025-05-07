---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Medium
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-04: Local Data Persistence

## Context
Ketika mengembangkan sebuah aplikasi, terutama pada pengembangan aplikasi mobile, penyimpanan data lokal merupakan komponen penting agar aplikasi tetap dapat berjalan dalam kondisi offline atau saat koneksi internet tidak stabil. Local data persistence juga digunakan untuk caching, menyimpan preferensi pengguna, serta data yang telah disinkronkan dari server. Di Flutter, beberapa opsi penyimpanan populer meliputi SQLite, Hive, Sembast, ObjectBox, dan flutter_secure_storage.

## Decision
Kami memutuskan untuk menggunakan **SQLite** sebagai solusi utama penyimpanan data lokal untuk aplikasi Adonanku. SQLite cocok untuk menyimpan data terstruktur dalam format tabel dan mendukung query kompleks. Ini ideal untuk menyimpan data seperti daftar destinasi wisata, informasi vendor, dan histori reservasi pengguna.

## Alternatives
1. **flutter_secure_storage**  
   Solusi ini lebih cocok untuk penyimpanan data **sensitif**, seperti token akses atau kredensial login, karena mendukung penyimpanan terenkripsi. Namun, tidak cocok untuk menyimpan data dalam jumlah besar atau untuk kebutuhan query yang kompleks.

## Consequences
### ✅ Good:
- Mendukung penyimpanan data terstruktur dan kompleks dengan performa tinggi.
- Bisa digunakan untuk pencarian dan manipulasi data skala besar secara lokal tanpa koneksi internet.
- SQLite merupakan teknologi yang stabil, banyak digunakan, dan sudah matang dalam ekosistem Flutter.

### ❌ Bad:
- Tidak memiliki enkripsi bawaan, sehingga tidak ideal untuk menyimpan data yang sangat sensitif tanpa tambahan library keamanan.
- Perlu setup dan manajemen skema tabel, migrasi versi, dan validasi data secara manual, yang bisa menambah kompleksitas pengembangan.

