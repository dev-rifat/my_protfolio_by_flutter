import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 24 : 100),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 800),
            childAnimationBuilder: (w) => SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(child: w),
            ),
            children: [
              _buildHeader(),
              const SizedBox(height: 80),
              isMobile
                  ? Column(children: [_buildContactInfo(), const SizedBox(height: 50), _buildContactForm()])
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactInfo()),
                  const SizedBox(width: 80),
                  Expanded(child: _buildContactForm()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Color(0xFF3B82F6).withOpacity(0.5), blurRadius: 20)],
          ),
          child: const Text("Contact", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 20),
        const Text("Let's Work Together", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white)),
      ],
    );
  }

  Widget _buildContactInfo() {
    return _AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Contact Information", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 30),
            _contactRow(Icons.email, "engr.kamruz@gmail.com"),
            _contactRow(Icons.link, "linkedin.com/in/kamruz-zaman"),
            _contactRow(Icons.code, "github.com/kamruz-zzaman"),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return _AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Send a Message", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 30),
            _glowField("Name", Icons.person),
            _glowField("Email", Icons.email),
            _glowMessageField(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  padding: const EdgeInsets.all(18),
                  elevation: 10,
                  shadowColor: const Color(0xFF1A73E8).withOpacity(0.6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Send Message", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glowField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _glowMessageField() {
    return TextField(
      maxLines: 5,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Your message...",
        filled: true,
        fillColor: const Color(0xFF1E293B),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)]),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Color(0xFF3B82F6).withOpacity(0.4), blurRadius: 15)],
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }
}

class _AnimatedCard extends StatelessWidget {
  final Widget child;
  const _AnimatedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1621),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(color: Colors.black45, blurRadius: 30, offset: const Offset(0, 15)),
            BoxShadow(color: const Color(0xFF3B82F6).withOpacity(0.2), blurRadius: 40),
          ],
        ),
        child: child,
      ),
    );
  }
}