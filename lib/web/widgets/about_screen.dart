
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Services Icons
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              serviceItem("Website Development", Icons.web),
              serviceItem("App Development", Icons.phone_android),
              serviceItem("Website Hosting", Icons.cloud),
            ],
          ),

          // Right About Text
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About me",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(
                  "I started my software journey from photography. Through that, "
                      "I learned to love the process of creating from scratch. "
                      "This led me to software development as it fulfills my love "
                      "for learning and building things.",
                  style: GoogleFonts.poppins(
                      color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numberBox("120+", "Completed Projects"),
                    numberBox("95%", "Client Satisfaction"),
                    numberBox("10+", "Years Experience"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget serviceItem(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        Icon(icon, color: Colors.deepOrange, size: 32),
        const SizedBox(width: 15),
        Text(title,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20)),
      ],
    ),
  );
}

Widget numberBox(String number, String text) {
  return Column(
    children: [
      Text(number,
          style: GoogleFonts.poppins(
              color: Colors.deepOrange,
              fontSize: 28,
              fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      Text(text,
          style: GoogleFonts.poppins(
              color: Colors.white70, fontSize: 16)),
    ],
  );
}