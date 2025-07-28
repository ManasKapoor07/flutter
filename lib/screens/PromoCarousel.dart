import 'dart:async';
import 'package:flutter/material.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> banners = [
    {
      "image": "assets/images/bath.jpg",
      "title": "Welcome Gift – Flat 20% Off",
      "desc": "Sign up today and give your bathroom the elegance it deserves.",
      "cta": "Shop Now",
    },
    {
      "image": "assets/images/bath.jpg",
      "title": "Special Offer – Up to 40% Off",
      "desc": "Upgrade your bathroom easily with stylish essentials.",
      "cta": "Explore",
    },
    {
      "image": "assets/images/bath.jpg",
      "title": "Welcome Gift – Flat 20% Off",
      "desc": "Sign up today and give your bathroom the elegance it deserves.",
      "cta": "Shop Now",
    },
    {
      "image": "assets/images/bath.jpg",
      "title": "Welcome Gift – Flat 20% Off",
      "desc": "Sign up today and give your bathroom the elegance it deserves.",
      "cta": "Shop Now",
    },
    {
      "image": "assets/images/bath.jpg",
      "title": "Welcome Gift – Flat 20% Off",
      "desc": "Sign up today and give your bathroom the elegance it deserves.",
      "cta": "Shop Now",
    },
    {
      "image": "assets/images/bath.jpg",
      "title": "Welcome Gift – Flat 20% Off",
      "desc": "Sign up today and give your bathroom the elegance it deserves.",
      "cta": "Shop Now",
    },
    // Add more banners if needed
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= banners.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage(banner["image"]!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.38),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 22, 100, 18),
                  child: SizedBox(
                    height: 90, // Fix for vertical overflow: constrain height
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner["title"]!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Text(
                            banner["desc"]!,
                            style: const TextStyle(
                              fontSize: 14.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 2,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            banner["cta"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (idx) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: idx == _currentPage ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: idx == _currentPage
                    ? const Color(0xFF2563EB)
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
