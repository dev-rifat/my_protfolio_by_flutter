import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_protfolio/utils/images.dart';
import '../../global/utils/link_url_service.dart';
import '../../global/widgets.dart';
import '../../utils/app_string.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  void copyToClipboard(BuildContext context, String value) {
    Clipboard.setData(ClipboardData(text: value));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          ContactString.snackCopiedText,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        duration: Duration(milliseconds: 600),
      ),
    );
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      color: const Color(0xFF0D1117),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: isMobile
            ? 24
            : isTablet
            ? 60
            : 120,
      ),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 800),
            childAnimationBuilder: (w) => SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(child: w),
            ),
            children: [
              _buildHeader(width),

              const SizedBox(height: 40),

              isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(isMobile, context),
                        const SizedBox(height: 30),
                        _buildContactForm(isMobile),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo(isMobile, context)),
                        const SizedBox(width: 40),
                        Expanded(child: _buildContactForm(isMobile)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------------
  // HEADER
  // -----------------------------

  Widget _buildHeader(double width) {
    final double titleSize = width < 500
        ? 26
        : width < 900
        ? 34
        : 45;

    return Column(
      children: [
        CustomButton(text: ContactString.titleBadge, onPressed: () {}),
        const SizedBox(height: 16),
        Text(
          ContactString.titleMain,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // -----------------------------
  // CONTACT INFO BOX
  // -----------------------------

  Widget _buildContactInfo(bool isMobile, BuildContext context) {
    return _AnimatedCard(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 18 : 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ContactString.contactHeader,
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            _contactRow(
              icon: AppImages.email,
              text: ContactString.emailText,
              context: context,
              onAction: () async {
                await openCustomUrl(ContactString.emailText);
              },
            ),

            _contactRow(
              icon: AppImages.linkdin,
              text: ContactString.linkedinText,
              context: context,
              onAction: () => openCustomUrl(ContactString.linkedinUrl),
            ),

            _contactRow(
              icon: AppImages.git,
              text: ContactString.githubText,
              context: context,
              onAction: () => openCustomUrl(ContactString.githubUrl),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  // CONTACT FORM
  // -----------------------------

  Widget _buildContactForm(bool isMobile) {
    return _AnimatedCard(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 18 : 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ContactString.sendMessageHeader,
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            _glowField("Name", Icons.person),
            _glowEmailField("Email", Icons.email),
            _glowMessageField(),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await openEmail(
                    _email.text,
                    body: _body.text,
                    subject: _name.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  padding: const EdgeInsets.all(16),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  // FORM FIELDS
  // -----------------------------

  Widget _glowField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: _name,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: _border(),
          enabledBorder: _border(color: Colors.white12),
          focusedBorder: _border(color: const Color(0xFF3B82F6), width: 2),
        ),
      ),
    );
  }

  Widget _glowEmailField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: _email,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: _border(),
          enabledBorder: _border(color: Colors.white12),
          focusedBorder: _border(color: const Color(0xFF3B82F6), width: 2),
        ),
      ),
    );
  }

  Widget _glowMessageField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _body,
        maxLines: 4,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: ContactString.messagePlaceholder,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: _border(),
          focusedBorder: _border(color: const Color(0xFF3B82F6), width: 2),
        ),
      ),
    );
  }

  OutlineInputBorder _border({
    Color color = Colors.transparent,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  // -----------------------------
  // CONTACT ITEM ROW
  // -----------------------------

  Widget _contactRow({
    required String icon,
    required String text,
    required BuildContext context,
    required Function onAction,
  }) {
    return InkWell(
      onTap: () => onAction(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(image: AssetImage(icon)),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white70, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.copy, color: Colors.white70, size: 18),
              onPressed: () => copyToClipboard(context, text),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------
// WRAPPER CARD ANIMATION
// -----------------------------

class _AnimatedCard extends StatelessWidget {
  final Widget child;
  const _AnimatedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1621),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
