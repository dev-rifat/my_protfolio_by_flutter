import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = [
    {"name": "TypeScript", "icon": Icons.code},
    {"name": "JavaScript", "icon": Icons.javascript},
    {"name": "Svelte", "icon": Icons.track_changes},
    {"name": "React", "icon": Icons.blur_circular},
    {"name": "TailwindCSS", "icon": Icons.waterfall_chart},
    {"name": "Supabase", "icon": Icons.bolt},
    {"name": "Vercel", "icon": Icons.cloud_done},
    {"name": "GitHub", "icon": Icons.star_border},
    {"name": "Figma", "icon": Icons.design_services},
    {"name": "Motion (JS Library)", "icon": Icons.motion_photos_on},
    {"name": "3js (JS Library)", "icon": Icons.auto_fix_high},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: skills.map((skill) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF0E1A2B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(skill["icon"], color: Colors.white70, size: 18),
                const SizedBox(width: 6),
                Text(
                  skill["name"],
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
