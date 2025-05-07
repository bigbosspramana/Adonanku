---
status: Accepted
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Flutter Documentation
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-06: Navigation & Routing Solution

## Context
Dalam pengembangan aplikasi Adonanku, sistem navigasi memegang peran penting karena aplikasi mencakup banyak halaman dengan alur yang saling terhubung, seperti halaman input bahan, daftar resep, konversi bahan, dan status stok. Seiring bertambahnya kompleksitas fitur, dibutuhkan solusi navigasi yang mampu menangani aliran data antar halaman secara konsisten.

Pengelolaan navigasi yang baik akan mendukung pengalaman pengguna yang lancar serta memudahkan pengembang dalam mengelola alur aplikasi secara deklaratif dan terstruktur, sekaligus mendukung pengembangan fitur-fitur baru tanpa membebani arsitektur yang sudah ada.

## Decision
Kami memutuskan untuk menggunakan go_router sebagai solusi navigasi utama di aplikasi Adonanku. go_router menawarkan berbagai fitur unggulan, termasuk kemampuan untuk menangani deep links, nested routes, dan deklarative navigation dengan mudah, yang akan sangat berguna untuk mengelola rute aplikasi yang berkembang.

go_router juga lebih sederhana sekaligus lebih fleksibel dalam menangani skenario navigasi kompleks yang dapat terjadi seiring bertambahnya fitur di aplikasi.

## Alternatives
1. **Navigator 2.0** <br>
    Navigator 2.0 memberikan kontrol lebih mendalam terhadap alur navigasi dan routing aplikasi dengan pendekatan deklaratif. Namun, penggunaannya lebih kompleks dan membutuhkan lebih banyak boilerplate code dibandingkan dengan go_router.

## Consequences
### ✅ Good:
- Fleksibilitas dalam manajemen rute, memungkinkan penggunaan deep links dan nested routes dengan lebih mudah.
- Deklaratif dan terstruktur, memungkinkan pengelolaan alur aplikasi yang lebih jelas dan mudah dipahami.
- Integrasi mudah dengan Flutter, mendukung pengembangan lebih cepat dengan lebih sedikit boilerplate code.

### ❌ Bad:
- Perlu penyesuaian tim terutama yang belum familiar dengan konsep deklaratif navigation dan pengaturan deep linking.
