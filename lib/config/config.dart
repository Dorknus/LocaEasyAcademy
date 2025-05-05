import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseApiKey => dotenv.env['SUPABASE_API_KEY'] ?? '';
  static String get brevoApiKey => dotenv.env['BREVO_API_KEY'] ?? '';
}
