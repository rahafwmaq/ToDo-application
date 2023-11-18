import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/pages/home_page/home_page.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/background_tamplate.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';
import 'package:flutter_todo_project6_supabase/pages/loading_page/widgets/logo.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/navigator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      context.pushAndRemoveUntil(page: const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundTamplate(),
          Logo(),
          Positioned(
            top: 250,
            left: 20,
            child: CustomText(
              text: "To Do ...",
              fontFamily: 'DancingScript',
              fontColor: appColdYellow,
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            top: 340,
            left: 20,
            child: CustomText(
              text: "Application",
              fontFamily: 'DancingScript',
              fontColor: appWhite,
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
