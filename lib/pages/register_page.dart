import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final SupabaseService service = SupabaseService();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  bool _isLoading = false;

  void register() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    
    try {
      // 1. Ambil context messenger & navigator sebelum async
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);

      // 2. Lakukan registrasi
      await service.signUp(emailController.text.trim(), passwordController.text.trim());
      
      // 3. Paksa logout untuk mematikan auto-login bawaan Supabase
      await service.signOut();
      
      // 4. Beri notifikasi sukses
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Registrasi Berhasil! Silakan login untuk melanjutkan."),
          backgroundColor: Colors.green,
        ),
      );
      
      // 5. Kembali ke halaman login
      // Karena RegisterPage dibuka dari LoginPage (push), maka pop akan kembali ke Login
      navigator.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registrasi Gagal: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Akun Baru"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                validator: (val) => val == null || val.isEmpty ? "Email wajib diisi" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                validator: (val) => val == null || val.isEmpty ? "Password wajib diisi" : null,
              ),
              const SizedBox(height: 25),
              _isLoading 
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    child: const Text("Daftar Sekarang"),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
