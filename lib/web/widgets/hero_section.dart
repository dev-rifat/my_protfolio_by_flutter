
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Text("I’m Rifat",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Apps Developer",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              Row(
                children: [
                  customBtn("Got a project?", Colors.deepOrange),
                  const SizedBox(width: 20),
                  customBtn("My resume", Colors.transparent,
                      border: true),
                ],
              )
            ],
          ),

          // RIGHT IMAGE
          Container(
            height: 350,
            width: 350,
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
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x&vertical=center", // <-- replace
                  height: 260,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customBtn(String text, Color color, {bool border = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: border
          ? Border.all(color: Colors.deepOrange, width: 2)
          : null,
    ),
    child: Text(text,
        style: GoogleFonts.poppins(
          color: border ? Colors.white : Colors.black,
          fontSize: 16,
        )),
  );
}
