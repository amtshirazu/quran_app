import 'package:flutter/material.dart';
import 'package:quran_app/features/reflection/presentation/widgets/reflection_header.dart';
import 'package:quran_app/features/reflection/presentation/widgets/reflection_body.dart';

class ReflectionScreen extends StatelessWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const ReflectionHeader(),
          const Expanded(child: ReflectionBody()),
        ],
      ),
    );
  }
}
