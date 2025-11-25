import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 24 : 120,
      ),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          _buildSectionHeader(),
          const SizedBox(height: 60),

          // Main Content - Exactly like image
          _buildMainContent(isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2A3A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "About Me",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Who I Am",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Description
        _buildMainDescription(),
        const SizedBox(height: 50),

        // Features Grid - 3 columns on desktop, 1 on mobile
        _buildFeaturesGrid(isMobile),
        const SizedBox(height: 50),

        // Journey Section
        _buildJourneySection(),
      ],
    );
  }

  Widget _buildMainDescription() {
    return Text(
      "I'm a passionate Full Stack Developer with expertise in building modern web applications. With a strong foundation in both frontend and backend technologies, I create seamless digital experiences that solve real-world problems.",
      style: GoogleFonts.poppins(
        color: Colors.white70,
        fontSize: 18,
        height: 1.8,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildFeaturesGrid(bool isMobile) {
    final features = [
      {
        'title': 'Reliable & Secure',
        'description': 'I build applications with security and reliability at their core, ensuring your data is protected.',
        'icon': Icons.security,
      },
      {
        'title': 'Innovative Solutions',
        'description': 'I leverage cutting-edge technologies to create innovative solutions for complex problems.',
        'icon': Icons.lightbulb_outline,
      },
      {
        'title': 'User-Focused Design',
        'description': 'I prioritize user experience, creating intuitive interfaces that delight users.',
        'icon': Icons.design_services,
      },
    ];

    if (isMobile) {
      return Column(
        children: features.map((feature) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _buildFeatureCard(
                feature['title'].toString()!,
                feature['description'].toString()!,
                feature['icon'] as IconData,
              ),
            ),
        ).toList(),
      );
    }

    return Row(
      children: features.map((feature) =>
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildFeatureCard(
                feature['title'].toString()!,
                feature['description'].toString()!,
                feature['icon'] as IconData,
              ),
            ),
          ),
      ).toList(),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1621),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with background
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A73E8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1A73E8),
              size: 28,
            ),
          ),
          const SizedBox(height: 24),
          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          // Description
          Text(
            description,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1621),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title with Icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A73E8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.work_history,
                  color: Color(0xFF1A73E8),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "My Journey",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Journey Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "With over 4 years of experience in web development, I've worked on projects ranging from small business websites to large-scale enterprise applications. This journey has strengthened my expertise in building modern, scalable, and user-focused solutions.",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "I'm passionate about continuous learning and always adapting to new technologies, ensuring I deliver innovative applications that exceed client expectations in both performance and design.",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}