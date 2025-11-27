import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/utils/images.dart';
import '../../global/utils/link_url_service.dart';
import '../../utils/app_string.dart';

class HeroSection extends StatefulWidget {
  final Function(String) onMenuTap;

  const HeroSection({super.key, required this.onMenuTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1100;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 20
                : isTablet
                ? 50
                : 80,
            vertical: isMobile
                ? 40
                : isTablet
                ? 60
                : 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: _leftText(isMobile, isTablet),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Opacity(
                      opacity: _fadeAnimation.value,
                      child: _rightImage(isMobile, isTablet),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(-_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _leftText(isMobile, isTablet),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _rightImage(isMobile, isTablet),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _leftText(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          HeroStrings.hi,
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: isMobile
                ? 24
                : isTablet
                ? 32
                : 38,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          HeroStrings.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile
                ? 36
                : isTablet
                ? 48
                : 62,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          HeroStrings.title,
          style: GoogleFonts.poppins(
            color: Colors.blueAccent,
            fontSize: isMobile
                ? 38
                : isTablet
                ? 52
                : 66,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          HeroStrings.description,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 24,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildButton(
              HeroStrings.viewWork,
              Colors.blueAccent,
              isMobile,
              click: () => widget.onMenuTap("Projects"),
            ),
            _buildButton(
              HeroStrings.resume,
              Colors.transparent,
              isMobile,
              border: true,
              click: () => openCustomUrl(HeroStrings.resumeUrl),
            ),
          ],
        ),
        SizedBox(height: 12),

        Row(
          mainAxisAlignment:isMobile ? MainAxisAlignment.center:MainAxisAlignment.start,
          children: [
            _icon(AppImages.git, () async {
              await openCustomUrl(ContactString.githubUrl);
            }),
            SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _icon(AppImages.linkdin, () async {
                await openCustomUrl(ContactString.linkedinUrl);
              }),
            ),
            SizedBox(width: 20),

            _icon(
              AppImages.email,
              () async {
                await openCustomUrl(ContactString.emailText);
              },
              width: 50,
              height: 50,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    Color bgColor,
    bool isMobile, {
    bool border = false,
    required Function click,
  }) {
    return GestureDetector(
      onTap: () => click(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 18,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(3),
            border: border
                ? Border.all(color: Colors.blueAccent, width: .6)
                : null,
          ),
          child: border
              ? Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF020817),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_outlined, size: 18),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _rightImage(bool isMobile, bool isTablet) {
    double containerSize = isMobile
        ? 280
        : isTablet
        ? 360
        : 440;
    double imageSize = isMobile
        ? 220
        : isTablet
        ? 290
        : 350;

    return Container(
      height: containerSize,
      width: containerSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Color(0xFF1E2A3A), Color(0xFF0E1621)],
        ),
      ),
      child: Center(
        child: ClipOval(
          child: Image.asset(
            AppImages.me,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _icon(
    String url,
    VoidCallback action, {
    double width = 36,
    double height = 36,
  }) {
    return InkWell(
      onTap: action,
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          url,
          fit: BoxFit.contain,
          opacity: const AlwaysStoppedAnimation(.7),// ensures image scales correctly
        ),
      ),
    );
  }
}
