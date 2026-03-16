# Absensi Organisasi

## Deskripsi Aplikasi
Aplikasi **Absensi Organisasi** adalah aplikasi berbasis mobile yang dirancang untuk memudahkan manajemen kehadiran anggota dalam suatu organisasi. Aplikasi ini dibangun menggunakan framework **Flutter** dan memanfaatkan **Supabase** sebagai sistem backend untuk autentikasi dan penyimpanan data. Aplikasi ini memberikan kemudahan dalam pencatatan kehadiran yang akurat serta mendukung kustomisasi visual melalui mode terang dan gelap.

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
- **Scaffold** 
- **AppBar** 
- **Form & TextFormField** 
- **DropdownButtonFormField** 
- **ElevatedButton & TextButton** 
- **IconButton** 
- **ListView & ListView.builder** 
- **FutureBuilder:* 
- **RefreshIndicator** 
- **Card** 
- **CircleAvatar** 
- **CircularProgressIndicator** 
- **SnackBar** 
- **AlertDialog** 

## Tampilan Aplikasi


