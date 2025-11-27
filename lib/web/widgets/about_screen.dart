import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global/widgets.dart';
import '../../utils/app_string.dart';

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
          // Section Badge
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomButton(
              text: AboutMeStrings.sectionTitle,
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 12),

          // Title
          _animated(
            delay: 0,
            child: Text(
              AboutMeStrings.title,
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
          _animated(
            delay: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                AboutMeStrings.description,
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

          // Features & Journey (Responsive)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;

                return isMobile
                    ? Column(
                  children: [
                    _buildFeatures(),
                    const SizedBox(height: 80),
                    _buildJourneyCard(),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _buildFeatures()),
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

  // -------------------------
  // FEATURES COLUMN
  // -------------------------
  Widget _buildFeatures() {
    return Column(
      children: [
        _featureItem(
          Icons.shield_rounded,
          AboutMeStrings.feature1Title,
          AboutMeStrings.feature1Desc,
        ),
        const SizedBox(height: 32),
        _featureItem(
          Icons.lightbulb_rounded,
          AboutMeStrings.feature2Title,
          AboutMeStrings.feature2Desc,
        ),
        const SizedBox(height: 32),
        _featureItem(
          Icons.design_services_rounded,
          AboutMeStrings.feature3Title,
          AboutMeStrings.feature3Desc,
        ),
      ],
    );
  }

  // -------------------------
  // FEATURE ITEM
  // -------------------------
  Widget _featureItem(IconData icon, String title, String desc) {
    return _animated(
      delay: 150,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(3),
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

  // -------------------------
  // JOURNEY CARD
  // -------------------------
  Widget _buildJourneyCard() {
    return _animated(
      delay: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AboutMeStrings.journeyTitle,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AboutMeStrings.journeyDesc,
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

  // -------------------------
  // REUSABLE ANIMATION
  // -------------------------
  Widget _animated({required Widget child, required int delay}) {
    return AnimatedSlide(
      offset: const Offset(0, 0.3),
      duration: Duration(milliseconds: 700 + delay),
      child: child,
    );
  }
}


