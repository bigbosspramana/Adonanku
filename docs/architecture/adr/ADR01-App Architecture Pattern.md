# ADR-01: Menentukan App Architecture Pattern

**Date:** Rabu, 08-05-2025  
**Status:** Accepted  
**Decider:** Alvin Yuga Pramana <br>
**Consulted:** Artificial Intelligience (GPT), Wikipedia, Medium, Flutter Documentation <br>
**Informed:** Derick Norlan, Edrick Saputra Lionard

## Context
Pada tahap awal pengembangan aplikasi, penting untuk memilih pola arsitektur yang dapat memberikan struktur yang jelas dan mendukung pengembangan jangka panjang. Pola ini akan membantu memisahkan tanggung jawab antar bagian aplikasi, membuat kode lebih mudah dirawat, diuji, dan dikembangkan ke depannya. Beberapa pilihan yang dipertimbangkan antara lain MVC, MVP, MVVM, Clean Architecture, dan Hexagonal Architecture.

## Decision
Kami memilih menggunakan pola arsitektur MVVM (Model-View-ViewModel) karena pola ini membantu memisahkan tampilan aplikasi (apa yang dilihat pengguna) dari logika program (cara aplikasi bekerja). Dengan cara ini, perubahan tampilan tidak akan mengganggu bagian lain, sehingga lebih mudah untuk memelihara dan mengembangkan aplikasi. Selain itu, MVVM membuat proses pengujian bagian logika aplikasi menjadi lebih mudah, karena logika tidak tercampur dengan tampilan. Bagaimana cara MVVM bekerja dalam aplikasi kami? misalnya, user sedang menambah bahan kue maka User mengisi data di View (nama: "Tepung", jumlah : 5) kemudian ViewModel menangkap input tersebut, validasi, lalu simpan di database (Melalui Mode)

## Alternatives
1. **MVC (Model - View - Controller)**<br>
    MVC adalah pola arsitektur klasik yang membagi aplikasi menjadi tiga bagian: Model (data), View (antarmuka pengguna), dan Controller (logika). Keunggulan utamanya adalah kesederhanaan dan mudah diimplementasikan untuk aplikasi kecil. Namun, Controller bisa menjadi terlalu kompleks jika aplikasi bertambah besar.

2. **MVP (Model - View - Presenter)**<br>
    MVP memisahkan logika dari tampilan dengan lebih baik dibanding MVC. View hanya menampilkan data, sementara Presenter mengatur data dan interaksi. Cocok untuk aplikasi yang membutuhkan pengujian dan pemisahan logika. Namun, Presenter bisa menjadi terlalu kompleks.

3. **Clean Architecture**<br>
    Clean Architecture memisahkan sistem ke dalam beberapa lapisan seperti Entities, Use Cases, Interface Adapters, dan Frameworks. Cocok untuk proyek besar karena kode jadi sangat modular dan mudah diuji. Tapi bisa terasa rumit untuk aplikasi kecil karena struktur yang kompleks.

4. **Hexagonal Architecture (Ports and Adapters)**<br>
    Hexagonal Architecture memisahkan logika inti dari elemen eksternal (UI, database, API) melalui konsep Ports (interface) dan Adapters (implementasi). Cocok untuk aplikasi besar dan fleksibel terhadap perubahan teknologi, namun terlalu kompleks untuk aplikasi sederhana.

## Consequences
### Good:
- Kode lebih rapi dan terstruktur, karena tampilan dan logika dipisahkan.
- Lebih mudah untuk diuji, terutama bagian logika (ViewModel).
- Mendukung pembaruan otomatis pada tampilan saat data berubah, sehingga cocok untuk aplikasi modern.
- Mempermudah kerja tim, karena pengembang UI dan pengembang logika bisa bekerja secara terpisah.

### Bad:
- Butuh waktu untuk belajar, terutama bagi yang belum terbiasa dengan pola MVVM.
- Struktur kode bisa terasa rumit pada aplikasi kecil atau proyek yang sangat sederhana.
- Data binding atau komunikasi antara bagian bisa membingungkan jika tidak diatur dengan benar.