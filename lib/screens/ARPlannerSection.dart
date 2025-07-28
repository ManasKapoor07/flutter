import 'package:flutter/material.dart';

class ARPlannerSection extends StatelessWidget {
  const ARPlannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 700;

    return SafeArea(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: isMobile
              ? screenSize.height * 0.85
              : screenSize.height * 0.75,
        ),

        // color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: isMobile
                ? SingleChildScrollView(child: _buildColumnLayout(isMobile))
                : _buildRowLayout(isMobile),
          ),
        ),
      ),
    );
  }

  Widget _buildRowLayout(bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(right: 32),
            child: _buildTextContent(isMobile),
          ),
        ),
        Flexible(flex: 5, child: _buildImageCard()),
      ],
    );
  }

  Widget _buildColumnLayout(bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageCard(),
        SizedBox(height: isMobile ? 28 : 32),
        _buildTextContent(isMobile),
      ],
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge(),
          SizedBox(height: isMobile ? 12 : 16),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 22 : 26,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                height: 1.3,
              ),
              children: [
                const TextSpan(text: 'Bring Your Dream Bathroom '),
                TextSpan(
                  text: 'to Life ',
                  style: TextStyle(color: Colors.blue[700]),
                ),
                const TextSpan(text: 'in AR'),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 14 : 20),
          Text(
            'Instantly preview, arrange, and personalize every fixture and style in your actual space.',
            style: TextStyle(
              fontSize: isMobile ? 14.5 : 15.5,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 6 : 8),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: isMobile ? 14.5 : 15.5, height: 1.6),
              children: [
                TextSpan(
                  text: 'Our immersive AR planner ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[700],
                  ),
                ),
                const TextSpan(
                  text:
                      'delivers unmatched realism—helping you make confident choices before you build.',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 12 : 14),
          Text(
            'Rotate, zoom, and swap between designs in real-time from your phone or desktop!',
            style: TextStyle(
              fontSize: isMobile ? 14 : 15,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 20),
          const Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              Text(
                '• Real-product textures & scale',
                style: TextStyle(color: Colors.blue, fontSize: 14.5),
              ),
              Text(
                '• Try before you buy',
                style: TextStyle(color: Colors.blue, fontSize: 14.5),
              ),
              Text(
                '• Share & collaborate on ideas',
                style: TextStyle(color: Colors.blue, fontSize: 14.5),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 20 : 24),
          // MODERN BUTTON START
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, color: Colors.white, size: 22),
            label: Text(
              'Launch AR Planner',
              style: TextStyle(
                fontSize: isMobile ? 16 : 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.blue.shade900;
                } else if (states.contains(WidgetState.hovered)) {
                  return Colors.blue.shade600;
                }
                return Colors.blue[700]!;
              }),
              elevation: WidgetStateProperty.resolveWith<double>((states) {
                if (states.contains(WidgetState.pressed)) {
                  return 12;
                }
                return 6;
              }),
              shadowColor: WidgetStateProperty.all(
                Colors.blue.shade800.withOpacity(0.6),
              ),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: isMobile ? 26 : 30,
                  vertical: isMobile ? 14 : 16,
                ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              ),
              overlayColor: WidgetStateProperty.all(
                Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // MODERN BUTTON END
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/generate.png',
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: const [
                Icon(Icons.vrpano_outlined, size: 18, color: Colors.blue),
                SizedBox(width: 6),
                Text(
                  'AR Mode Enabled',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _badge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFDDEFFF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'NEXT-GEN VISUALIZATION',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF2563EB),
          fontSize: 12.5,
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}
