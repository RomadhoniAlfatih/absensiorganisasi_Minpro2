class Absensi {
  final int? id;
  final String nama;
  final String nim;
  final String divisi;
  final String status;
  final String? kegiatan;

  Absensi({
    this.id,
    required this.nama,
    required this.nim,
    required this.divisi,
    required this.status,
    this.kegiatan,
  });

  factory Absensi.fromMap(Map<String, dynamic> map) {
    return Absensi(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      divisi: map['divisi'],
      status: map['status'],
      kegiatan: map['kegiatan'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'divisi': divisi,
      'status': status,
      'kegiatan': kegiatan,
    };
  }
}