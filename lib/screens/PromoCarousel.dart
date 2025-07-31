import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  int _current = 0;
  final List<_PromoItem> items = [
    _PromoItem(
      image: 'assets/images/bath.jpg',
      title: 'Big Monsoon Sale',
      subtitle: 'Up to 60% off on select vanities! Shop now.',
      cta: 'Shop Now',
    ),
    _PromoItem(
      image: 'assets/images/bath.jpg',
      title: 'Luxury Essentials',
      subtitle: 'Give your bathroom the makeover it deserves.',
      cta: 'Explore',
    ),
    // Add more banners as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          options: CarouselOptions(
            aspectRatio: 16 / 8,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            viewportFraction: 0.88,
            pageSnapping: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemBuilder: (context, index, realIdx) {
            final item = items[index];
            return _PromoCard(item: item);
          },
        ),
        const SizedBox(height: 12),
        // Animated indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            final selected = _current == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              width: selected ? 24 : 7,
              height: 7,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _PromoItem {
  final String image;
  final String title;
  final String subtitle;
  final String cta;
  _PromoItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.cta,
  });
}

class _PromoCard extends StatelessWidget {
  final _PromoItem item;
  const _PromoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(item.image, fit: BoxFit.cover),
          // Gradient overlay for text clarity
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF2563EB),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(item.cta),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
