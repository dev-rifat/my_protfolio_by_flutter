import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0D1117),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          // Badge
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: CustomButton(
              text: 'About Me',
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 40),

          // Title
          AnimatedSlide(
            duration: const Duration(milliseconds: 800),
            offset: const Offset(0, 0.3),
            child: Text(
              'Who I Am',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Description
          AnimatedSlide(
            duration: const Duration(milliseconds: 900),
            offset: const Offset(0, 0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "I'm a passionate Full Stack Developer with expertise in building modern web applications. "
                    "With a strong foundation in both frontend and backend technologies, I create seamless digital "
                    "experiences that solve real-world problems.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.8,
                ),
              ),
            ),
          ),

          const SizedBox(height: 100),

          // Responsive Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 900;

                return isMobile
                    ? Column(
                  children: [
                    _buildFeaturesColumn(),
                    const SizedBox(height: 80),
                    _buildJourneyCard(),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _buildFeaturesColumn()),
                    const SizedBox(width: 100),
                    Expanded(child: _buildJourneyCard()),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 80),

        ],
      ),
    );
  }

  Widget _buildFeaturesColumn() {
    return Column(
      children: [
        _featureItem(Icons.shield_rounded, 'Reliable & Secure', 'I build applications with security and reliability at their core, ensuring your data is protected.'),
        const SizedBox(height: 32),
        _featureItem(Icons.lightbulb_rounded, 'Innovative Solutions', 'I leverage cutting-edge technologies to create innovative solutions for complex problems.'),
        const SizedBox(height: 32),
        _featureItem(Icons.design_services_rounded, 'User-Focused Design', 'I prioritize user experience, creating intuitive interfaces that delight users.'),
      ],
    );
  }

  Widget _featureItem(IconData icon, String title, String desc) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 700),
      offset: const Offset(0, 0.3),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B82F6).withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                    color: Colors.white60,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyCard() {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 900),
      offset: const Offset(0, 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Journey',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "With over 4 years of experience in web development, I’ve worked on projects ranging from small business websites to large-scale enterprise applications. This journey has strengthened my expertise in building modern, scalable, and user-focused solutions.\n\n"
                "I’m passionate about continuous learning and always adapting to new technologies, ensuring I deliver innovative applications that exceed client expectations in both performance and design.",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
              height: 1.8,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}