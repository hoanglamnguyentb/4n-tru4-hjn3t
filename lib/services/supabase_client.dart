import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> init() async {
    const supabaseUrl = 'https://ukhdpibwizukjocsqfhq.supabase.co';
    final supabaseKey = dotenv.env['SUPABASE_KEY']!;

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
