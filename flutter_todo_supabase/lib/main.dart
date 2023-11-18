import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/pages/loading_page/loading_page.dart';
import 'package:flutter_todo_project6_supabase/services/supabase_config.dart';

void main() {
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingPage(),
    );
  }
}
