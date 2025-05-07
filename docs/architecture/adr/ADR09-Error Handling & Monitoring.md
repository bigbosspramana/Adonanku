---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT), Youtube
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-09: Error Handling & Monitoring

## Context
Dalam pengembangan aplikasi Adonanku, menangani error dengan baik sangat penting untuk memastikan aplikasi tetap stabil. Menggunakan alat seperti Sentry atau Firebase Crashlytics akan membantu melaporkan dan memantau error yang terjadi di aplikasi secara real-time. Alat ini memungkinkan tim pengembang untuk dengan cepat mengetahui dan memperbaiki masalah yang muncul. Selain itu, logging kustom bisa digunakan untuk mencatat error secara lebih detail, memberikan gambaran yang jelas tentang masalah yang terjadi dan memastikan aplikasi berfungsi dengan baik.

## Decision
Kami memutuskan untuk menggunakan Sentry sebagai solusi utama untuk error monitoring dan pelaporan pada aplikasi Adonanku. Pemilihan ini didasarkan pada kemudahan integrasi dengan Flutter, kemampuannya menangkap error otomatis maupun manual, serta dashboard real-time yang menyediakan konteks mendalam (stack trace, breadcrumbs, device info, dll). Penggunaan Sentry memungkinkan tim untuk secara proaktif mengidentifikasi error di versi produksi dan mempercepat proses perbaikan bug. Ini mendukung tujuan Adonanku untuk memberikan pengalaman pengguna yang andal, terutama pada momen krusial seperti pengelolaan bahan, konversi resep, dan deteksi stok kedaluwarsa.

## Alternatives
1. **Custom Logging** <br>
    Membuat sistem pencatatan error internal (misalnya menyimpan log ke file lokal atau mengirim ke server backend).

    Kelebihan:
    - Penuh kendali terhadap format dan penyimpanan.
    - Bisa disesuaikan dengan kebutuhan aplikasi dan UI.

    Kekurangan:
    - Memerlukan waktu pengembangan tambahan.
    - Tidak menyediakan fitur real-time dashboard, tracking pengguna, atau analitik error seperti Sentry.
    - Risiko kehilangan data jika terjadi crash sebelum log terkirim.

## Consequences
### ✅ Good:
- Error bisa dilacak secara real-time dengan detail lengkap (stack trace, breadcrumbs, device info).
- Mendukung berbagai platform, termasuk Flutter (mobile) dan Laravel (backend API).
- Dashboard interaktif membantu tim melihat tren error dari waktu ke waktu, serta memudahkan proses debugging lintas tim.

### ❌ Bad:
- Ketergantungan pada layanan pihak ketiga (jika Sentry down atau batas gratis terlampaui).
- Perlu pengelolaan data sensitif dengan hati-hati agar tidak bocor ke Sentry (misalnya informasi user dalam error message).

