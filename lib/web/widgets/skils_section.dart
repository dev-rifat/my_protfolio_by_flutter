import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global/widgets.dart';
import '../../utils/app_string.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final newValue = offset > 100;

    if (newValue != _isScrolled) {
      setState(() => _isScrolled = newValue);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020817), Color(0xFF020817), Color(0xFF031847)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(0, _isScrolled ? -20 : 0, 0),
            child: CustomButton(text: SkillsStrings.title, onPressed: () {}),
          ),

          const SizedBox(height: 40),

          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _isScrolled ? 1 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              transform: Matrix4.translationValues(0, _isScrolled ? 0 : 40, 0),
              child: Text(
                SkillsStrings.subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          SingleChildScrollView(
            controller: _scrollController,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 30,
              children: [
                SkillCategory(
                  title: SkillsStrings.categoryMobile,
                  skills: SkillsStrings.mobileSkills,
                  color: Colors.blueAccent,
                  delay: 0,
                ),
                SkillCategory(
                  title: SkillsStrings.categoryState,
                  skills: SkillsStrings.stateSkills,
                  color: Colors.blueAccent,
                  delay: 100,
                ),
                SkillCategory(
                  title: SkillsStrings.categoryApi,
                  skills: SkillsStrings.apiSkills,
                  color: Colors.blueAccent,
                  delay: 200,
                ),
                SkillCategory(
                  title: SkillsStrings.categoryFeatures,
                  skills: SkillsStrings.featureSkills,
                  color: Colors.blueAccent,
                  delay: 300,
                ),
                SkillCategory(
                  title: SkillsStrings.categoryPush,
                  skills: SkillsStrings.pushSkills,
                  color: Colors.blueAccent,
                  delay: 400,
                ),
                SkillCategory(
                  title: SkillsStrings.categoryTools,
                  skills: SkillsStrings.toolSkills,
                  color: Colors.blueAccent,
                  delay: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatefulWidget {
  final String title;
  final List<String> skills;
  final Color color;
  final int delay;

  const SkillCategory({
    super.key,
    required this.title,
    required this.skills,
    required this.color,
    required this.delay,
  });

  @override
  State<SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<SkillCategory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start animation after delay
    Future.delayed(Duration(milliseconds: 500 + widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _slideAnimation.value,
            child: Transform.scale(
              scale: _isHovered ? 1.02 : _scaleAnimation.value,
              child: Opacity(opacity: _opacityAnimation.value, child: child),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 340,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Color(0xff0e1628),
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_isHovered ? 0.4 : 0.0),
                blurRadius: _isHovered ? 25 : 0,
                spreadRadius: _isHovered ? 2 : 0,
                offset: Offset(0, _isHovered ? 8 : 0),
              ),
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.3),
              //   blurRadius: 10,
              //   spreadRadius: 1,
              //   offset: const Offset(0, 4),
              // ),
            ],
            border: Border.all(
              color: widget.color.withOpacity(_isHovered ? 0.3 : 0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Title
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      // gradient: LinearGradient(
                      //   colors: [widget.color, widget.color.withOpacity(0.7)],
                      // ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Skills Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.skills
                    .asMap()
                    .entries
                    .map(
                      (entry) => _SkillChip(
                        skill: entry.value,
                        color: widget.color,
                        delay: entry.key * 100,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String skill;
  final Color color;
  final int delay;

  const _SkillChip({
    required this.skill,
    required this.color,
    required this.delay,
  });

  @override
  State<_SkillChip> createState() => __SkillChipState();
}

class __SkillChipState extends State<_SkillChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(Duration(milliseconds: 800 + widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _isHovered ? 1.1 : _scaleAnimation.value,
            child: Opacity(opacity: _opacityAnimation.value, child: child),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? LinearGradient(
                    colors: [widget.color, widget.color.withValues(alpha: 0.8)],
                  )
                : LinearGradient(
                    colors: [
                      widget.color.withValues(alpha: 0.4),
                      widget.color.withValues(alpha: 0.4),
                      widget.color.withValues(alpha: 0.4),
                      widget.color.withValues(alpha: 0.4),
                    ],
                  ),
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Text(
            widget.skill,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
