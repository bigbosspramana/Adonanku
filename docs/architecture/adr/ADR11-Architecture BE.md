---
status: Proposed
date: 2025-07-05
deciders: Alvin Yuga Pramana
consulted: Artificial Intelligience (GPT)
informed: Derick Norlan, Edrick Saputra Lionard
---

# ADR-11: Architecture BE

## Context
Dalam pengembangan backend aplikasi **Adonanku**, diperlukan pola arsitektur yang mampu memberikan struktur terorganisir, mudah dikembangkan, serta memisahkan logika bisnis, pengelolaan data, dan antarmuka pengguna backend (API). Backend akan menangani fitur-fitur penting seperti input dan pengelolaan bahan baku, pengecekan status stok otomatis, konversi resep, serta sinkronisasi data dengan frontend.

Beberapa pola arsitektur backend yang umum digunakan adalah MVC (Model-View-Controller), Clean Architecture, Hexagonal Architecture, dan Layered Architecture. Masing-masing memiliki pendekatan berbeda dalam pemisahan tanggung jawab dan pengelolaan kompleksitas. 

## Decision
Kami memilih menggunakan pola arsitektur **MVC (Model - View - Controller)** untuk backend aplikasi Adonanku. MVC adalah arsitektur yang terbukti sederhana, jelas dalam pemisahan tanggung jawab, serta sangat cocok digunakan dalam framework seperti **Laravel**, yang sudah mengintegrasikan MVC secara optimal dan kebetulan tim lebih memahami pola penggunaan mvc.

## Alternatives
1. **Clean Architecture**  
   Menyediakan struktur modular dengan pemisahan layer yang ketat (Entities, Use Cases, Interfaces, Frameworks). Cocok untuk skala enterprise, tapi terlalu kompleks untuk proyek yang masih bertumbuh.

2. **Hexagonal Architecture (Ports and Adapters)**  
   Fokus pada fleksibilitas terhadap teknologi eksternal (database, UI, dll.). Ideal untuk aplikasi yang membutuhkan integrasi lintas platform, tapi kurva belajarnya cukup tinggi.

3. **Layered Architecture (n-tier)**  
   Mengelompokkan aplikasi dalam layer (Presentation, Business, Data Access), memberikan struktur, tetapi bisa berujung pada ketergantungan berlapis dan sulit ditelusuri bila tidak dikelola dengan baik.

## Consequences
### ✅ Good:
- Struktur sederhana dan mudah dipahami, cocok untuk pengembang backend baru maupun berpengalaman.
- Dukungan penuh oleh framework Laravel, termasuk routing, model binding, dan resource controller.
- Mudah dikembangkan secara bertahap dan diintegrasikan dengan frontend berbasis API.
- Cukup fleksibel untuk kebutuhan CRUD dan pengelolaan data yang kompleks.

### ❌ Bad:
- Tidak se-modular arsitektur seperti Clean atau Hexagonal untuk proyek skala besar.
- Bisa berisiko memiliki *fat controller* atau *fat model* jika tidak dipecah dengan baik.
- Kurang ideal untuk skenario domain logic yang sangat kompleks atau butuh skalabilitas ekstrem.

