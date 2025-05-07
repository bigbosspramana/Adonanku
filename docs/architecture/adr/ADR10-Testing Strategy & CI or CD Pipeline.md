---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT)
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-10: Testing Strategy & CI/CD Pipeline

## Context
Untuk menjaga kualitas aplikasi Adonanku selama proses pengembangan, diperlukan strategi pengujian. Namun, mengingat tahap pengembangan saat ini masih awal dan tim masih kecil, maka pendekatan manual dianggap cukup untuk sementara waktu.

## Decision
Kami memutuskan untuk **menggunakan pengujian manual** tanpa implementasi pipeline CI/CD otomatis. Tim akan melakukan pengujian secara langsung pada perangkat untuk memverifikasi fungsionalitas fitur dan mendeteksi bug secara manual sebelum rilis.

## Alternatives
1. **Testing Berlapis dengan CI/CD Otomatis**  
   Menggunakan unit, integration, dan end-to-end testing yang dijalankan otomatis di pipeline seperti GitHub Actions. Ini memberikan hasil pengujian yang konsisten, tetapi membutuhkan waktu dan effort setup lebih besar.

2. **Testing End-to-End saja**  
   Fokus hanya pada pengujian perilaku pengguna nyata, tanpa testing level rendah seperti unit dan integration test.

## Consequences
### ✅ Good:
- Lebih cepat dilakukan saat pengembangan awal karena tidak perlu konfigurasi pipeline dan framework testing otomatis.
- Tim bisa fokus pada pengembangan fitur tanpa terdistraksi oleh setup testing dan CI/CD.

### ❌ Bad:
- **Rentan terhadap human error** karena tidak ada pengecekan otomatis.
- **Susah dilacak** jika ada bug berulang (karena tidak ada log test yang tersimpan otomatis).
- Sulit melakukan **regression testing**, terutama saat fitur semakin banyak.
- Tidak scalable jika aplikasi terus bertumbuh dan melibatkan lebih banyak developer.

