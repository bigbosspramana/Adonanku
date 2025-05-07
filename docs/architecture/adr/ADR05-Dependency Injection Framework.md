---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT)
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-05: Dependency Injection Framework

## Context
Dalam pengembangan aplikasi Adonanku, kami membutuhkan cara yang efisien untuk mengelola pustaka eksternal (dependencies) yang digunakan dalam aplikasi. Mengingat keterbatasan waktu dan keahlian, kami perlu memilih solusi yang sederhana namun efektif.

## Decision
Kami memilih menggunakan pub.dev untuk mengelola dependencies di aplikasi Adonanku. pub.dev adalah alat resmi untuk Flutter yang memungkinkan kami menambah dan mengelola pustaka eksternal dengan mudah menggunakan pubspec.yaml. 

## Alternatives
1. **Getlt** <br>
    GetIt berfungsi sebagai service locator, memungkinkan objek yang terdaftar digunakan di seluruh aplikasi tanpa perlu dibuat ulang. Pendaftaran dependensi dilakukan secara manual, memberikan fleksibilitas dan kontrol penuh atas objek yang dikelola. Solusi ini sangat ringan dan cocok untuk aplikasi yang menggunakan pola MVVM atau BLoC yang modular.

## Consequences
### ✅ Good:
- Mudah dan cepat dalam mengelola dependencies.
- Kompatibel langsung dengan Flutter.

### ❌ Bad:
- Tergantung pada pustaka yang tersedia di pub.dev, mungkin tidak selalu memenuhi kebutuhan spesifik.

### Mitigasi :
- mengimpor dependencies secara manual dengan menambahkan path atau URL pada file pubspec.yaml.