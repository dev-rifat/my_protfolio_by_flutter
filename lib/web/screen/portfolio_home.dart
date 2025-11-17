
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/about_screen.dart';
import '../widgets/heder_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/skils_section.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A2B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HederSection(),
            HeroSection(),
            SkillsSection(),
            AboutScreen(),
          ],
        ),
      ),
    );
  }
}
