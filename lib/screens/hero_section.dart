import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFEFF5FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildNavBar(context),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? 420 : 1150,
                    ),
                    child: isMobile
                        ? _buildColumn(context)
                        : _buildRow(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- NAVIGATION BAR --------------------
  Widget _buildNavBar(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo + Brand
          Row(
            children: [
              Image.asset('assets/images/logo.png', height: 34),
              const SizedBox(width: 12),
              const Text(
                'M & Co.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),

          if (!isMobile)
            Row(
              children: [
                _navLink('Home'),
                _navLink('Products'),
                _navLink('About'),
                _navLink('Contact'),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.w500,
          color: Color(0xFF334155),
        ),
      ),
    );
  }

  // -------------------- HERO LAYOUT --------------------

  Widget _buildRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _content(context)),
        Expanded(child: _imageSection()),
      ],
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_imageSection(), _content(context)],
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.79),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.07),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _brandBadge(),
              const SizedBox(height: 28),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Remodel Smarter—\n',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        height: 1.22,
                      ),
                    ),
                    TextSpan(
                      text: 'Professionally.',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue[600],
                        height: 1.22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'Shop 200+ luxury brands handpicked for architects and homeowners.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Explore faucets, sanitaryware, basins, and CP fittings—for the perfect finish.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey[400],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue[700],
                      elevation: 0,
                    ),
                    child: const Text(
                      'Explore Products',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: Colors.blue[600]!, width: 1.4),
                    ),
                    child: Text(
                      'See Our Vision',
                      style: TextStyle(fontSize: 17, color: Colors.blue[700]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageSection() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.blue.withOpacity(0.07)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset('assets/images/bath.jpg', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _brandBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'ALL BRANDS, ONE PLATFORM',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Color(0xFF2563EB),
          letterSpacing: 1.15,
        ),
      ),
    );
  }
}
