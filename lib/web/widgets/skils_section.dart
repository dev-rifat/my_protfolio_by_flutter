import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// class SkillsSection extends StatelessWidget {
//   const SkillsSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF323543),
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "What I can do",
//             style: GoogleFonts.poppins(
//               fontSize: 32,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 40),
//
//           /// MAIN ROW (LEFT CARDS + RIGHT SKILLS)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               /// LEFT SIDE – SERVICES
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(child: _serviceCard(Icons.android, "Android Dev")),
//                         const SizedBox(width: 20),
//                         Expanded(child: _serviceCard(Icons.language, "Web Dev")),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(child: _serviceCard(Icons.apple, "iOS Dev")),
//                         const SizedBox(width: 20),
//                         Expanded(child: _serviceCard(Icons.desktop_windows, "Desktop Dev")),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(width: 40),
//
//               /// RIGHT SIDE – SKILLS BADGES
//               Expanded(
//                 flex: 6,
//                 child: Wrap(
//                   spacing: 14,
//                   runSpacing: 14,
//                   children: [
//                     _skillBadge("Flutter", Icons.flutter_dash),
//                     _skillBadge("Dart", Icons.bolt),
//                     _skillBadge("HTML5", Icons.html),
//                     _skillBadge("CSS3", Icons.css),
//                     _skillBadge("JS", Icons.javascript),
//                     _skillBadge("Hugo", Icons.h_mobiledata),
//                     _skillBadge("Docker", Icons.dns),
//                     _skillBadge("Python", Icons.code),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   /// SERVICE CARD WIDGET
//   Widget _serviceCard(IconData icon, String title) {
//     return Container(
//       height: 110,
//       decoration: BoxDecoration(
//         color: const Color(0xFF3E4250),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: Colors.white70, size: 30),
//           const SizedBox(width: 10),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               color: Colors.white70,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// SKILL BADGE WIDGET
//   Widget _skillBadge(String title, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xFF3E4250),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: Colors.white70, size: 18),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: const Color(0xFF0F172A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Skills",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            "Technical Expertise",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            "Here are the technologies and tools I work with to build modern web applications.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 40),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 25,
            runSpacing: 25,
            children: const [
              SkillCategory(
                title: "Frontend",
                skills: [
                  "JavaScript (ES6+)",
                  "TypeScript",
                  "React.js",
                  "Next.js",
                  "HTML5",
                  "CSS3",
                  "Tailwind CSS",
                  "Bootstrap",
                  "Redux",
                  "Responsive Design",
                  "SEO-friendly Development",
                ],
              ),
              SkillCategory(
                title: "Backend",
                skills: [
                  "Node.js",
                  "Express.js",
                  "REST API",
                  "GraphQL",
                  "MongoDB",
                  "PostgreSQL",
                  "Database Design",
                  "Query Optimization",
                  "Firebase",
                ],
              ),
              SkillCategory(
                title: "Cloud DevOPS",
                skills: [
                  "AWS (EC2, S3, SES)",
                  "Vercel",
                  "Netlify",
                  "Docker",
                  "CI/CD Pipelines (GitHub Actions, GitLab CI/CD)",
                ],
              ),
              SkillCategory(
                title: "Tools",
                skills: [
                  "Git",
                  "GitHub",
                  "GitLab",
                  "Jira",
                  "Trello",
                  "Figma",
                  "Jest",
                ],
              ),
              SkillCategory(
                title: "Others",
                skills: [
                  "Agile/Scrum Methodologies",
                  "Problem-Solving",
                  "Debugging",
                  "Cross-functional Team Collaboration",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const SkillCategory({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map(
                  (skill) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  skill,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}