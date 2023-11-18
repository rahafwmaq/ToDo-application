import 'package:supabase_flutter/supabase_flutter.dart';

supabaseConfig() async {
  await Supabase.initialize(
      url: 'https://ownhsxrcwqomkspehwrc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bmhzeHJjd3FvbWtzcGVod3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk5NjE3MTQsImV4cCI6MjAxNTUzNzcxNH0.i6h8wbVagWYH4vT3t39z2FLtE_Mxnbu4dlT6NGbFRU4');
}
