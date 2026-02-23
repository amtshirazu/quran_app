import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';





class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Quran App'
      ),
      body: CustomButton(
          text: "Start Reading",
          onPressed: () {
            context.go('/quran');
          },
      ),
    );
  }
}
