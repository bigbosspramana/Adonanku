# ADR-02: State Management Approach

**Date:** Rabu, 07-05-2025  
**Status:** Proposed  
**Decider:** Alvin Yuga Pramana <br>
**Consulted:** gpt, wikipedia, medium <br>
**Informed:** Derick Norlan, Edrick saputra lionard


## Context
Dalam pengembangan aplikasi, penting untuk memilih cara yang baik dalam mengelola status UI, logika aplikasi, dan aliran data, terutama ketika aplikasi semakin besar. Tanpa manajemen status yang baik, aplikasi bisa menjadi sulit dikelola. Beberapa solusi yang dipertimbangkan untuk ini adalah Provider, BLoC, dan Riverpod, yang masing-masing memiliki kelebihan dan kekurangan dalam hal kemudahan penggunaan, kemampuan untuk berkembang, dan kemudahan pemeliharaan.

## Decision
Kami memilih untuk menggunakan BLoC karena pendekatan ini sangat cocok untuk memisahkan logika aplikasi dari lapisan presentasi. BLoC memungkinkan data mengalir dalam bentuk stream yang dapat dengan mudah dikontrol dan diuji. Ini memberikan struktur yang jelas, sangat cocok untuk tim besar, dan membantu menjaga UI tetap bersih dari logika bisnis.

Contoh alur penggunaan BLoC dalam aplikasi kami:
* View (UI) memanggil event: misalnya pengguna menekan tombol "Tambah Bahan".
* BLoC menerima event TambahBahanEvent, memproses logika bisnis seperti validasi, dan menyimpan data ke database.
* Setelah data berhasil ditambahkan, BLoC mengeluarkan state baru BahanBerhasilDitambahkanState.
* View mendengarkan state, dan akan merespons dengan menampilkan daftar bahan terbaru secara otomatis.

## Alternatives
**

## Consequences


### ✅ Good:
- 

### ❌ Bad:
- 