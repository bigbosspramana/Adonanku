# ADR-02: State Management Approach

**Date:** Rabu, 07-05-2025  
**Status:** Proposed  
**Decider:** Alvin Yuga Pramana <br>
**Consulted:** Artificial Intelligience (GPT), wikipedia, medium <br>
**Informed:** Derick Norlan, Edrick saputra lionard


## Context
Dalam pengembangan aplikasi Adonanku, pengelolaan state menjadi aspek krusial karena aplikasi ini memiliki berbagai fitur dinamis seperti manajemen stok bahan, konversi resep otomatis, dan pengecekan status bahan (expired, menipis, habis). Seiring dengan bertambahnya kompleksitas fitur, dibutuhkan pendekatan pengelolaan state yang tidak terstruktur dapat menyebabkan kode sulit dipelihara, diuji, dan dikembangkan.

Flutter menawarkan beberapa pendekatan manajemen state seperti Provider, Riverpod, Redux, dan BLoC. Kami perlu memilih pendekatan yang paling sesuai dengan kebutuhan aplikasi adonanku.


## Decision
Kami memutuskan untuk menggunakan Riverpod sebagai solusi utama dalam pengelolaan state pada aplikasi. Keputusan ini didasarkan pada fleksibilitas tinggi yang ditawarkan Riverpod, integrasinya yang erat dengan bahasa Dart, serta keunggulannya yang tidak bergantung pada BuildContext, berbeda dengan pendekatan seperti Provider. Hal ini menjadikan Riverpod lebih modular, mudah diuji, dan mudah dirawat dalam jangka panjang.

Adapun keunggulan Riverpod yang menjadi pertimbangan utama kami meliputi:
* Pemisahan yang jelas antara UI dan logika bisnis, yang mempermudah pemeliharaan dan pengembangan fitur.
* Tidak bergantung pada BuildContext, sehingga memungkinkan pengelolaan state secara global dan mendukung unit testing secara lebih efisien.
* Mendukung berbagai jenis state management, seperti Provider, StateProvider, StateNotifierProvider, dan FutureProvider.
* Reaktif terhadap perubahan data tanpa boilerplate yang berlebihan.

Dengan mempertimbangkan keunggulan-keunggulan tersebut, Riverpod dipilih sebagai pondasi arsitektur state management untuk mendukung skalabilitas dan stabilitas aplikasi ke depannya.

## Alternatives
* **Provider**<br>
Lebih sederhana dan cocok untuk aplikasi kecil, namun memiliki keterbatasan dalam arsitektur besar dan bergantung pada BuildContext.
* **BLoC (Business Logic Component)**<br>
Memiliki struktur yang sangat terorganisir dan cocok untuk tim besar, tetapi memiliki kurva belajar yang tinggi dan banyak boilerplate.

## Consequences
### ✅ Good:
- Lebih testable: Karena tidak bergantung pada context dan widget tree, pengujian unit dan widget lebih mudah.
- Lebih modular: Dapat memisahkan state logic dari UI tanpa kesulitan.
- Reaktif: UI otomatis merespon perubahan state.
- Fleksibel: Bisa mengelola state sinkron dan asinkron dengan pendekatan berbeda.

### ❌ Bad:
- Butuh pembelajaran awal: Bagi yang terbiasa dengan Provider, konsep ref, watch, dan read butuh waktu untuk dipahami.
- Dokumentasi bisa membingungkan: Karena fleksibilitas tinggi, developer bisa bingung memilih jenis provider yang tepat (StateProvider, FutureProvider, NotifierProvider, dll).