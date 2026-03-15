import 'package:flutter/material.dart';
import '../services/supabase_service.dart';
import '../models/absensi.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{

  final _formKey = GlobalKey<FormState>();
  final SupabaseService service = SupabaseService();

  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController divisiController = TextEditingController();
  TextEditingController kegiatanController = TextEditingController();

  String _status = 'Hadir';
  bool _isLoading = false;

  void simpan() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final absensi = Absensi(
        nama: namaController.text,
        nim: nimController.text,
        divisi: divisiController.text,
        status: _status,
        kegiatan: kegiatanController.text,
      );
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);
      await service.createAbsensi(absensi);

      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text("Data berhasil disimpan")),
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
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Absensi"),
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
                validator: (val) => val == null || val.isEmpty ? "Nama tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? "NIM tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: divisiController,
                decoration: const InputDecoration(
                  labelText: "Divisi",
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? "Divisi tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: kegiatanController,
                decoration: const InputDecoration(
                  labelText: "Kegiatan Organisasi",
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? "Kegiatan tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                initialValue: _status,
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
                    onPressed: simpan,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text("Simpan Data", style: TextStyle(fontSize: 16)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}