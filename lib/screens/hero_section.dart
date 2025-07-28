import 'package:flutter/material.dart';
import '/screens/PromoCarousel.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFEAEAEC), height: 1),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Tabs
          Container(
            color: Colors.white,
            child: Row(
              children: const [
                Expanded(child: TabButton(label: "Home", selected: true)),
                Expanded(child: TabButton(label: "Category", selected: false)),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEAEAEC)),

          // Banner Carousel
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: PromoCarousel(),
          ),

          // New Arrivals Section
          SectionHeader(title: "New Arrivals", onSeeAll: () {}),
          SizedBox(
            height: 218,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                ProductCard(
                  name: "Element Plus Star Closet",
                  price: "₹ 20,000*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
                ProductCard(
                  name: "Counter Top Wash Basin",
                  price: "₹ 27,800*",
                  img: "assets/images/bath.jpg",
                  isFavorite: true,
                ),
                ProductCard(
                  name: "Accent Table Top Basin",
                  price: "₹ 7,000*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
                ProductCard(
                  name: "Neocomm1 Smart Toilet",
                  price: "₹ 1,25,000*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
              ],
            ),
          ),

          // Promo Banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            decoration: BoxDecoration(
              color: primaryBlue.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Your Dream Bathroom Vanity Just Became a Reality\nTap This Banner to Explore!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),

          // Popular Products Section
          SectionHeader(title: "Popular Products", onSeeAll: () {}),
          SizedBox(
            height: 218,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                ProductCard(
                  name: "Elegant White Closet",
                  price: "₹ 12,439*",
                  img: "assets/images/bath.jpg",
                  isFavorite: true,
                ),
                ProductCard(
                  name: "Electric Wash Basin",
                  price: "₹ 4,627*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
                ProductCard(
                  name: "Prime Water Closet",
                  price: "₹ 10,227*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
                ProductCard(
                  name: "Orin Wash Basin",
                  price: "₹ 8,640*",
                  img: "assets/images/bath.jpg",
                  isFavorite: false,
                ),
              ],
            ),
          ),

          // Big Promo Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/images/bath.jpg", fit: BoxFit.cover),
                  // Gradient overlay for improved text contrast
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "The 2025 Collection",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            letterSpacing: 0.6,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.black45,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Experience the Next Level of Refinement",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                            shadows: [
                              Shadow(
                                blurRadius: 5,
                                color: Colors.black38,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.85),
                            shadowColor: Colors.black54,
                            elevation: 8,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: const Text(
                            "Discover the Collection",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 76), // for bottom nav bar spacing
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 6,
        currentIndex: 0,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

// =========== Subcomponents ===========

class TabButton extends StatelessWidget {
  final String label;
  final bool selected;

  const TabButton({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        border: selected
            ? Border(
                bottom: BorderSide(color: const Color(0xFF2563EB), width: 2.8),
              )
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected
                ? const Color(0xFF2563EB)
                : Colors.black.withOpacity(.52),
          ),
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final String title, desc, ctaText, imageUrl;

  const HomeBanner({
    super.key,
    required this.title,
    required this.desc,
    required this.ctaText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF1FE),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              imageUrl,
              height: 130, // fitting parent's height
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: SizedBox(
              height: 100, // limit height to avoid overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.7,
                      color: Color(0xFF22223B),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      desc,
                      style: TextStyle(fontSize: 14.1, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      minimumSize: const Size(88, 36),
                    ),
                    onPressed: () {},
                    child: Text(ctaText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionHeader({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 11, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
              fontSize: 19,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              "See All",
              style: TextStyle(
                color: const Color(0xFF2563EB),
                fontSize: 14.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name, price, img;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final Color accentColor = const Color(0xFF2563EB);

    return Material(
      elevation: 4,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          // Add onTap action here
        },
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with drop shadow and favorite icon
              Stack(
                children: [
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(
                        img,
                        width: 170,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Favorite icon with gradient circle background
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: isFavorite
                              ? [Colors.redAccent.shade200, Colors.red.shade700]
                              : [Colors.white70, Colors.white70],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            offset: const Offset(0, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.white : Colors.grey[400],
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 11),

              // Product Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.grey[900],
                    height: 1.3,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Price with accent bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 20,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[850],
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
