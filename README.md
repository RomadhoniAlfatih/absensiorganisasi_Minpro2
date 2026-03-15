# Absensi Organisasi

## Deskripsi Aplikasi
Aplikasi **Absensi Organisasi** adalah solusi digital berbasis mobile yang dirancang untuk memudahkan manajemen kehadiran anggota dalam suatu organisasi secara efisien. Aplikasi ini dibangun menggunakan framework **Flutter** dan memanfaatkan **Supabase** sebagai sistem backend untuk autentikasi dan penyimpanan data secara real-time. Dengan antarmuka yang modern, aplikasi ini memberikan kemudahan dalam pencatatan kehadiran yang akurat serta mendukung kustomisasi visual melalui mode terang dan gelap.

## Fitur Aplikasi
- **Registrasi & Login Akun:** Sistem autentikasi pengguna yang aman menggunakan Supabase Auth, memastikan hanya anggota terdaftar yang dapat mengelola data.
- **Manajemen Data Absensi (CRUD):**
  - **Tambah Data (Create):** Mencatat kehadiran dengan input Nama, NIM, Divisi, Status Kehadiran, dan Nama Kegiatan.
  - **Lihat Daftar (Read):** Menampilkan daftar kehadiran anggota dalam format list yang informatif dan mudah dibaca.
  - **Ubah Data (Update):** Memungkinkan perbaikan data absensi yang sudah ada.
  - **Hapus Data (Delete):** Menghapus catatan absensi yang tidak diperlukan dengan konfirmasi keamanan.
- **Dark/Light Mode:** Fitur perpindahan tema aplikasi yang mendukung kenyamanan mata pengguna, dengan preferensi yang tersimpan secara permanen menggunakan Shared Preferences.
- **Validasi Input:** Memastikan setiap data yang dimasukkan ke dalam sistem sudah lengkap dan benar melalui form validation.
- **Notifikasi Real-time:** Penggunaan SnackBar untuk memberikan umpan balik instan setelah setiap operasi data berhasil dilakukan.

## Widget yang Digunakan
Aplikasi ini memanfaatkan berbagai widget fundamental dan advanced dari Flutter:
- **Scaffold:** Sebagai kerangka utama untuk setiap halaman (halaman login, register, home, dll).
- **AppBar:** Digunakan untuk menampilkan judul aplikasi dan tombol aksi seperti ganti tema dan logout.
- **Form & TextFormField:** Komponen utama untuk menerima input teks dari pengguna dengan sistem validasi built-in.
- **DropdownButtonFormField:** Widget pilihan untuk menentukan status kehadiran anggota secara presisi.
- **ElevatedButton & TextButton:** Digunakan untuk interaksi utama seperti tombol masuk, daftar, dan simpan data.
- **IconButton:** Tombol ikonik yang digunakan untuk aksi edit, hapus, dan toggle tema di bagian header.
- **ListView & ListView.builder:** Digunakan untuk merender daftar absensi secara dinamis dan efisien.
- **FutureBuilder:** Widget krusial untuk menangani state data asinkron saat mengambil data dari database Supabase.
- **RefreshIndicator:** Memberikan kemampuan kepada pengguna untuk memperbarui list data dengan cara menarik layar ke bawah.
- **Card:** Digunakan sebagai kontainer item absensi untuk memberikan efek bayangan dan sudut melengkung yang modern.
- **CircleAvatar:** Menampilkan inisial nama anggota sebagai elemen visual di setiap baris absensi.
- **CircularProgressIndicator:** Memberikan indikasi visual (loading) saat aplikasi sedang memproses data atau menunggu respon server.
- **SnackBar:** Digunakan untuk menampilkan pesan informasi singkat di bagian bawah layar setelah sebuah aksi dilakukan.
- **AlertDialog:** Menampilkan jendela konfirmasi sebelum pengguna melakukan penghapusan data untuk mencegah kesalahan yang tidak sengaja.
