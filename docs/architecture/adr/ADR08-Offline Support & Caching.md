---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT)
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-08: Offline Support & Caching

## Context
Dalam pengembangan aplikasi Adonanku, strategi dukungan offline dan caching penting untuk meningkatkan responsivitas dan keandalan. Kami mempertimbangkan berbagai pendekatan seperti **HTTP caching headers**, **local-first data**, atau **layer caching kustom**.

Namun, karena keterbatasan waktu dan skill saat ini, kami memilih pendekatan hybrid, yaitu hanya beberapa halaman penting yang mendukung mode offline, sedangkan sisanya tetap membutuhkan koneksi internet.

## Decision
Kami memutuskan untuk **mengimplementasikan pendekatan hybrid offline-online**, di mana hanya halaman atau fitur tertentu yang memiliki dukungan offline (misalnya: daftar tempat wisata, informasi vendor populer), sedangkan fitur lain tetap online.

Pendekatan ini memungkinkan pengembangan lebih terfokus dan realistis, sambil tetap memberikan manfaat offline bagi pengguna yang sering mengalami keterbatasan koneksi.

## Alternatives
- Mendukung full offline mode sejak awal.
- Fokus 100% ke fitur online, dan offline ditunda untuk fase selanjutnya.

## Consequences
### ✅ Good:
- Pengguna tetap bisa mengakses informasi penting tanpa koneksi internet.
- Pengembangan lebih efisien karena hanya fitur terpenting yang dibangun untuk offline.
- Menjadi nilai tambah meskipun belum 100% offline.

### ❌ Bad:
- Pengalaman pengguna bisa sedikit tidak konsisten antar halaman (sebagian offline, sebagian online).
- Tetap perlu manajemen sinkronisasi data untuk bagian offline.
- Mungkin membutuhkan penjelasan di UI agar pengguna tahu halaman mana yang bisa diakses offline.
