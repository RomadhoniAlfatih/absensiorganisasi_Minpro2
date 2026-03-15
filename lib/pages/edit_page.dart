import 'package:flutter/material.dart';
import '../services/supabase_service.dart';
import '../models/absensi.dart';

class EditPage extends StatefulWidget {
  final Absensi absensi;

  const EditPage({
    super.key,
    required this.absensi,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final SupabaseService service = SupabaseService();

  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController divisiController;
  late TextEditingController kegiatanController;

  late String _status; 
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.absensi.nama);
    nimController = TextEditingController(text: widget.absensi.nim);
    divisiController = TextEditingController(text: widget.absensi.divisi);
    kegiatanController = TextEditingController(text: widget.absensi.kegiatan ?? "");
    _status = widget.absensi.status;
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    divisiController.dispose();
    kegiatanController.dispose();
    super.dispose();
  }

  void update() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final updatedAbsensi = Absensi(
        nama: namaController.text,
        nim: nimController.text,
        divisi: divisiController.text,
        status: _status,
        kegiatan: kegiatanController.text,
      );

      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);
      await service.updateAbsensi(widget.absensi.id!, updatedAbsensi);

      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text("Data berhasil diperbarui")),
      );
      navigator.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Terjadi kesalahan: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Absensi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Anggota",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "NIM tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: divisiController,
                decoration: const InputDecoration(
                  labelText: "Divisi",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Divisi tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: kegiatanController,
                decoration: const InputDecoration(
                  labelText: "Kegiatan Organisasi",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Kegiatan tidak boleh kosong" : null,
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                initialValue: ['Hadir', 'Izin', 'Sakit', 'Alfa'].contains(_status) ? _status : 'Hadir',
                decoration: const InputDecoration(
                  labelText: "Status Kehadiran",
                  border: OutlineInputBorder(),
                ),
                items: ['Hadir', 'Izin', 'Sakit', 'Alfa']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _status = val);
                },
              ),
              const SizedBox(height: 25),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: update,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Update Data", style: TextStyle(fontSize: 16)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
