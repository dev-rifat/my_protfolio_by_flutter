import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class HederSection extends StatelessWidget {
  const HederSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Portfolio",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          Row(
            children: [
              menuItem("Home"),
              menuItem("About"),
              menuItem("Projects"),
              menuItem("Contacts"),
            ],
          )
        ],
      ),
    );
  }
}


Widget menuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      title,
      style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
    ),
  );
}