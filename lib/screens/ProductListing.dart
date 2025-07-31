import 'package:flutter/material.dart';

// Product Model
class Product {
  final String name;
  final String price;
  final String img;
  final bool isFavorite;
  final double rating;
  final int reviewsCount;
  final String? badge;

  Product({
    required this.name,
    required this.price,
    required this.img,
    this.isFavorite = false,
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.badge,
  });
}

// Sample product data
final List<Product> sampleProducts = [
  Product(
    name: "Element Plus Star Closet",
    price: "₹ 20,000",
    img: "assets/images/bath.jpg",
    isFavorite: false,
    rating: 4.5,
    reviewsCount: 123,
    badge: "Best Seller",
  ),
  Product(
    name: "Counter Top Wash Basin",
    price: "₹ 27,800",
    img: "assets/images/bath.jpg",
    isFavorite: true,
    rating: 3.8,
    reviewsCount: 98,
  ),
  Product(
    name: "Accent Table Top Basin",
    price: "₹ 7,000",
    img: "assets/images/bath.jpg",
    isFavorite: false,
    rating: 4.2,
    reviewsCount: 54,
    badge: "Sale",
  ),
  Product(
    name: "Neocomm1 Smart Toilet",
    price: "₹ 1,25,000",
    img: "assets/images/bath.jpg",
    rating: 4.7,
    reviewsCount: 84,
  ),
  Product(
    name: "Elegant White Closet",
    price: "₹ 12,500",
    img: "assets/images/bath.jpg",
    isFavorite: true,
    rating: 4.0,
    reviewsCount: 74,
  ),
];

// Product Listing Widget
class ProductListing extends StatefulWidget {
  final Color accentColor;
  const ProductListing({super.key, required this.accentColor});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  late List<Product> products;

  @override
  void initState() {
    super.initState();
    products = List.from(sampleProducts);
  }

  void toggleFavorite(int index) {
    setState(() {
      products[index] = Product(
        name: products[index].name,
        price: products[index].price,
        img: products[index].img,
        isFavorite: !products[index].isFavorite,
        rating: products[index].rating,
        reviewsCount: products[index].reviewsCount,
        badge: products[index].badge,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 8,
          childAspectRatio: 3 / 4.8, // more vertical, prevents overflow
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            accentColor: widget.accentColor,
            onFavoriteToggle: () => toggleFavorite(index),
            onAddToCart: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${product.name} added to cart")),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;
  final Color accentColor;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.accentColor,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.7,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFavoriteToggle() {
    widget.onFavoriteToggle();
    _controller.forward().then((value) => _controller.reverse());
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    List<Widget> stars = [];
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, size: 15, color: Colors.amber));
    }
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, size: 15, color: Colors.amber));
    }
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, size: 15, color: Colors.amber));
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.asset(p.img, fit: BoxFit.cover),
                ),
                if (p.badge != null)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        p.badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Material(
                      color: p.isFavorite ? Colors.redAccent : Colors.white70,
                      shape: const CircleBorder(),
                      elevation: 6,
                      child: InkWell(
                        onTap: _onFavoriteToggle,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            p.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: p.isFavorite ? Colors.white : Colors.grey,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product Info Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      p.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xFF23262F),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          _buildStarRating(p.rating),
                          const SizedBox(width: 4),
                          Text(
                            '(${p.reviewsCount})',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          p.price,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: widget.accentColor,
                          ),
                        ),
                        if (p.badge == 'Sale')
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '₹ 19,999',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: widget.onAddToCart,
                  icon: const Icon(Icons.shopping_cart, size: 16),
                  label: const Text(
                    'ADD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 0.7,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
