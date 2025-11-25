import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 30,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// TITLE
          Text(
            "Portfolio",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// DESKTOP MENU
          if (!isMobile)
            Row(
              children: [
                menuItem("Home"),
                menuItem("About"),
                menuItem("Projects"),
                menuItem("Contact"),
              ],
            ),

          /// MOBILE MENU ICON
          if (isMobile)
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                );
              },
            ),
        ],
      ),
    );
  }
}

/// Desktop menu item
Widget menuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        color: Colors.white70,
        fontSize: 16,
      ),
    ),
  );
}

/// Drawer menu item
Widget drawerMenuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.white
      ),
    ),
  );
}
