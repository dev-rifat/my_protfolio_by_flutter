import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectModel(
        title: "Payrun",
        description:
        "Payrun is a web-based human resource management system that simplifies HR management with advanced analytics.",
        imageUrl:
        "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x&vertical=center",
        detailsUrl: "https://example.com",
        codeUrl: "https://github.com/",
        tags: ["Next", "Graphql", "Node", "Express", "AWS", "S3", "ECS"],
      ),
      ProjectModel(
        title: "EasyDesk",
        description:
        "EasyDesk is a complete online customer support solution with automation and ticket management.",
        imageUrl:
        "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x&vertical=center",
        detailsUrl: "https://example.com",
        codeUrl: "https://github.com/",
        tags: ["NextJS", "Node", "Express", "Postgres", "AWS", "S3"],
      ),
      ProjectModel(
        title: "Dimetra",
        description:
        "A platform for medical equipment order and delivery with real-time tracking and scheduling.",
        imageUrl:
        "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x&vertical=center",
        detailsUrl: "https://example.com",
        codeUrl: "https://github.com/",
        tags: ["React", "GraphQL", "Node", "Express", "AWS", "S3"],
      ),
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: screenWidth < 700 ? 16 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _sectionHeader(screenWidth),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1400) crossAxisCount = 4;
              else if (constraints.maxWidth > 1100) crossAxisCount = 3;
              else if (constraints.maxWidth > 750) crossAxisCount = 2;

              if (crossAxisCount == 1) {
                // Use Column for single column layout on mobile
                return Column(
                  children: projects
                      .map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ProjectCard(model: p),
                  ))
                      .toList(),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: _getChildAspectRatio(constraints.maxWidth),
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(model: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  double _getChildAspectRatio(double width) {
    if (width > 1400) return 0.75;
    if (width > 1100) return 0.78;
    if (width > 750) return 0.85;
    return 0.95;
  }

  Widget _sectionHeader(double width) {
    return Column(
      children: [

        CustomButton(
          text: 'Projects',
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        Text(
          "My Works",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: width < 700 ? 26 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Check out some of the projects I've worked on recently.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: width < 700 ? 14 : 16,
          ),
        ),
      ],
    );
  }
}

class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final String detailsUrl;
  final String codeUrl;
  final List<String> tags;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.detailsUrl,
    required this.codeUrl,
    required this.tags,
  });
}

class ProjectCard extends StatelessWidget {
  final ProjectModel model;
  const ProjectCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final padding = cardWidth * 0.04;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0E1621),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
                child: AspectRatio(
                  aspectRatio: cardWidth < 350 ? 1.3 : 15 / 9,
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.image, color: Colors.grey, size: 40),
                      );
                    },
                  ),
                ),
              ),
              // CONTENT
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: GoogleFonts.poppins(
                        fontSize: (cardWidth * 0.08).clamp(14, 20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: padding / 2),
                    Text(
                      model.description,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: (cardWidth * 0.05).clamp(12, 14),
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: padding / 2),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: model.tags
                          .map((tag) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding / 2,
                            vertical: padding / 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2A3A),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: (cardWidth * 0.035).clamp(10, 12),
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                    SizedBox(height: padding),
                    // FIXED BUTTONS SECTION - Use Row instead of Wrap with Flexible
                    Row(
                      children: [
                        _codeButton(),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _detailsButton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _codeButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0E1621),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.white24),
        ),
      ),
      onPressed: () {},
      icon: const Icon(Icons.code, color: Colors.white, size: 16),
      label: Text(
        "Code",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _detailsButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A73E8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Details",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}