import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Title Chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Contact",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              "Get In Touch",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              "Have a project in mind or want to discuss a potential collaboration? Feel free to reach out!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 800;

                return Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LEFT CARD — Contact Info
                    SizedBox(
                      width: isMobile ? double.infinity : 450,
                      child: _contactCard(),
                    ),

                    const SizedBox(height: 20, width: 20),

                    // RIGHT CARD — Contact Form
                    SizedBox(
                      width: isMobile ? double.infinity : 450,
                      child: _formCard(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // LEFT SIDE CARD
  Widget _contactCard() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Contact Information",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            "Feel free to reach out through any of these channels",
            style: TextStyle(color: Colors.white60),
          ),
          SizedBox(height: 20),

          _infoRow(
            icon: Icons.email,
            title: "Email",
            value: "engr.kamruz@gmail.com",
          ),

          SizedBox(height: 20),

          _infoRow(
            icon: Icons.link,
            title: "LinkedIn",
            value: "linkedin.com/in/kamruz-zaman",
          ),

          SizedBox(height: 20),

          _infoRow(
            icon: Icons.code,
            title: "GitHub",
            value: "github.com/kamruz-zzaman",
          ),
        ],
      ),
    );
  }

  // RIGHT SIDE CARD — Form
  Widget _formCard() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Send a Message",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Fill out the form below and I'll get back to you as soon as possible",
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 20),

          _inputField("Name", "Your name"),
          const SizedBox(height: 16),

          _inputField("Email", "Your email"),
          const SizedBox(height: 16),

          _inputField("Message", "Your message", maxLines: 5),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Send Message",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// CONTACT INFO ROW
class _infoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _infoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}

// INPUT FIELD
Widget _inputField(String title, String hint, {int maxLines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
      const SizedBox(height: 6),
      TextField(
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          filled: true,
          fillColor: const Color(0xFF111827),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF374151), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1),
          ),
        ),
      ),
    ],
  );
}
