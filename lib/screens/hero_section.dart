import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/screens/ProductListing.dart'; // Your custom widget
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<Map<String, dynamic>> categories = [
  {'icon': Icons.chair_alt, 'label': 'Furniture'},
  {'icon': Icons.spa, 'label': 'Spa'},
  {'icon': Icons.bathtub, 'label': 'Bathtubs'},
  {'icon': Icons.brush, 'label': 'Tiles'},
  {'icon': Icons.light, 'label': 'Lighting'},
  {'icon': Icons.set_meal, 'label': 'Fittings'},
];

final List<Map<String, String>> promoBanners = [
  {
    'image': 'assets/images/bath.jpg',
    'title': 'Mega Monsoon Sale!',
    'subtitle': 'Flat 60% OFF',
    'cta': 'SHOP NOW',
  },
  {
    'image': 'assets/images/generate.png',
    'title': 'Try AR Designer',
    'subtitle': 'Visualize your bathroom',
    'cta': 'TRY NOW',
  },
];

class HeroSection extends StatefulWidget {
  final Color primaryBlue;
  const HeroSection({super.key, required this.primaryBlue});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final TextEditingController _searchController = TextEditingController();
  int _current = 0;
  int _selectedCategoryIndex = -1;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onCategoryTap(int index, String category) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    // Implement navigation or filtering logic here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Selected: $category')));
  }

  @override
  Widget build(BuildContext context) {
    final primaryBlue = widget.primaryBlue;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/images/logo.png', height: 32),
        ),
        titleSpacing: 0,
        title: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87, size: 26),
            onPressed: () {},
            tooltip: "Search",
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
            tooltip: "Wishlist",
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
            tooltip: "Bag",
          ),
          const SizedBox(width: 7),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: SearchBar(
              controller: _searchController,
              primaryBlue: primaryBlue,
            ),
          ),

          // CATEGORY CHIPS
          SizedBox(
            height: 90,
            child: CategoryChips(
              categories: categories,
              primaryBlue: primaryBlue,
              selectedIndex: _selectedCategoryIndex,
              onCategoryTap: _onCategoryTap,
            ),
          ),

          const SizedBox(height: 18),

          // PROMO BANNER CAROUSEL + DOT INDICATOR
          PromoCarousel(
            banners: promoBanners,
            primaryBlue: primaryBlue,
            currentIndex: _current,
            onPageChanged: (i) {
              setState(() {
                _current = i;
              });
            },
          ),

          const SizedBox(height: 8),

          // FEATURED PRODUCTS HEADER
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 2.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: primaryBlue,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to all products page
                  },
                  child: const Text(
                    "VIEW ALL",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          // PRODUCT LISTING widget (your custom product list)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ProductListing(accentColor: Colors.blue),
          ),

          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.percent_rounded),
        onPressed: () {
          // TODO: Link to offers
        },
        tooltip: "Offers",
      ),
    );
  }
}

// SEARCH BAR WIDGET
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Color primaryBlue;
  const SearchBar({
    Key? key,
    required this.controller,
    required this.primaryBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 2,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          hintText: 'What are you looking for?',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.black54),
          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () => controller.clear(),
                  child: const Icon(Icons.clear, color: Colors.black45),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (text) {
          // TODO: Add search logic if needed
        },
      ),
    );
  }
}

// CATEGORY CHIPS WIDGET with improved style
class CategoryChips extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Color primaryBlue;
  final int selectedIndex;
  final Function(int, String) onCategoryTap;

  const CategoryChips({
    Key? key,
    required this.categories,
    required this.primaryBlue,
    required this.selectedIndex,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final cat = categories[idx];
          final bool isSelected = idx == selectedIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? primaryBlue.withOpacity(0.15) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: isSelected ? 10 : 6,
                  offset: Offset(0, isSelected ? 6 : 3),
                ),
              ],
              border: isSelected
                  ? Border.all(color: primaryBlue, width: 2)
                  : Border.all(color: Colors.transparent, width: 0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => onCategoryTap(idx, cat['label'].toString()),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: isSelected
                        ? primaryBlue
                        : primaryBlue.withOpacity(0.11),
                    radius: 22,
                    child: Icon(
                      cat['icon'] as IconData,
                      color: isSelected ? Colors.white : primaryBlue,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    cat['label'] as String,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color: isSelected ? primaryBlue : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// PROMO CAROUSEL WIDGET
class PromoCarousel extends StatelessWidget {
  final List<Map<String, String>> banners;
  final Color primaryBlue;
  final int currentIndex;
  final Function(int) onPageChanged;

  const PromoCarousel({
    Key? key,
    required this.banners,
    required this.primaryBlue,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 175,
            autoPlay: true,
            enlargeCenterPage: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            viewportFraction: 0.92,
            onPageChanged: (i, _) {
              onPageChanged(i);
            },
          ),
          items: banners.map((banner) {
            return Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(banner['image']!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            banner['subtitle']!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MaterialButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            onPressed: () {
                              // TODO: Implement CTA action
                            },
                            child: Text(
                              banner['cta']!,
                              style: TextStyle(
                                color: primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: banners.length,
              effect: ExpandingDotsEffect(
                activeDotColor: primaryBlue,
                dotColor: Colors.grey.shade300,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeroSection(primaryBlue: Colors.purple.shade700),
      theme: ThemeData(fontFamily: "Roboto"),
    ),
  );
}
