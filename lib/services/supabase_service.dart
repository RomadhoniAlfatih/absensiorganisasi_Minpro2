import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/absensi.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // --- AUTH METHODS ---
  Future<AuthResponse> signIn(String email, String password) async {
    return await supabase.auth.signInWithPassword(
        email: email, password: password);
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  User? get currentUser => supabase.auth.currentUser;

  // --- DATABASE METHODS ---
  Future<List<Absensi>> getAbsensi() async {
    final List<dynamic> data =
        await supabase.from('absensi').select().order('id');

    return data.map((item) => Absensi.fromMap(item)).toList();
  }

  Future createAbsensi(Absensi absensi) async {
    await supabase.from('absensi').insert(absensi.toMap());
  }

  Future updateAbsensi(int id, Absensi absensi) async {
    await supabase.from('absensi').update(absensi.toMap()).eq('id', id);
  }

  Future deleteAbsensi(int id) async {
    await supabase.from('absensi').delete().eq('id', id);
  }
}
