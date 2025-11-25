import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    /// RESPONSIVE BREAKPOINTS
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1100;
    bool isDesktop = width >= 1100;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : isTablet ? 40 : 60,
        vertical: isMobile ? 20 : isTablet ? 40 : 50,
      ),

      /// LAYOUT RESPONSIVE
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _leftText(isMobile, isTablet, isDesktop),
          const SizedBox(height: 30),
          _rightImage(isMobile, isTablet, isDesktop),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
        isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isTablet ? 2 : 3,
            child: _leftText(isMobile, isTablet, isDesktop),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: isTablet ? 2 : 3,
            child: Align(
              alignment: isTablet
                  ? Alignment.centerRight
                  : Alignment.center,
              child: _rightImage(isMobile, isTablet, isDesktop),
            ),
          ),
        ],
      ),
    );
  }
}

//
// LEFT TEXT (Responsive)
//
Widget _leftText(bool isMobile, bool isTablet, bool isDesktop) {
  return Column(
    crossAxisAlignment:
    isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      Text(
        "Hello,",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: isMobile
              ? 20
              : isTablet
              ? 26
              : 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        "I’m Rifat",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: isMobile
              ? 28
              : isTablet
              ? 34
              : 42,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        "Apps Developer",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: isMobile
              ? 32
              : isTablet
              ? 38
              : 48,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 25),

      /// BUTTONS
      Wrap(
        spacing: 20,
        runSpacing: 12,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
        children: [
          customBtn("Got a project?", Colors.deepOrange, isMobile),
          customBtn("My resume", Colors.transparent, isMobile, border: true),
        ],
      )

    ],
  );
}

//
// RIGHT IMAGE (Responsive)
//
Widget _rightImage(bool isMobile, bool isTablet, bool isDesktop) {
  double size = isMobile
      ? 220
      : isTablet
      ? 280
      : 350;

  double imageSize = isMobile
      ? 160
      : isTablet
      ? 220
      : 260;

  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          Colors.red.withOpacity(0.2),
          Colors.transparent,
        ],
      ),
    ),
    child: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: Image.network(
          "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x&vertical=center",
          height: imageSize,
        ),
      ),
    ),
  );
}

//
// BUTTON (Responsive)
//
Widget customBtn(String text, Color color, bool isMobile, {bool border = false}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 14 : 22,
      vertical: isMobile ? 10 : 14,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: border ? Border.all(color: Colors.deepOrange, width: 2) : null,
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: border ? Colors.white : Colors.black,
        fontSize: isMobile ? 14 : 16,
      ),
    ),
  );
}
