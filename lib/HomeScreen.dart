import 'package:flutter/material.dart';

class Product {
  final String brand;
  final String name;
  final double price;
  final double? oldPrice;
  final String? badge; // e.g., "-20% OFF", "BESTSELLER"
  final String? badgeColor; // 'red' or 'black'
  final bool isFavorite;
  final String image;
  final String? reviews;
  final double? rating;

  Product({
    required this.brand,
    required this.name,
    required this.price,
    this.oldPrice,
    this.badge,
    this.badgeColor,
    required this.isFavorite,
    required this.image,
    this.reviews,
    this.rating,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['Women', 'Men', 'Sale', 'Shoes', 'Bags'];
  int selectedCategoryIndex = 0;

  final List<Product> newArrivals = [
    Product(
      brand: 'LOOMA STUDIO',
      name: 'Structured Wool Blazer',
      price: 189,
      oldPrice: 240,
      badge: '-20% OFF',
      badgeColor: 'red',
      isFavorite: false,
      rating: 4.8,
      image: 'https://images.unsplash.com/photo-1591561954557-26941169b49e?auto=format&fit=crop&q=80&w=400',
    ),
    Product(
      brand: 'ATELIER NINE',
      name: 'Pleated Linen Trousers',
      price: 95,
      isFavorite: false,
      image: 'https://images.unsplash.com/photo-1624312648710-3882773cbf6d?auto=format&fit=crop&q=80&w=400',
    ),
  ];

  final List<Product> trendingProducts = [
    Product(
      brand: 'ESSENTIALS',
      name: 'Poplin Boxy Shirt',
      price: 78,
      reviews: '114 reviews',
      isFavorite: false,
      image: 'https://images.unsplash.com/photo-1604068545802-0ee893f946ed?auto=format&fit=crop&q=80&w=400',
    ),
    Product(
      brand: 'FOOTWEAR',
      name: 'Sculptural Leather Mules',
      price: 210,
      badge: 'BESTSELLER',
      badgeColor: 'black',
      reviews: '86 reviews',
      isFavorite: false,
      image: 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?auto=format&fit=crop&q=80&w=400',
    ),
    Product(
      brand: 'KNITWEAR',
      name: 'Ribbed Merino Pullover',
      price: 110,
      oldPrice: 150,
      badge: '-15%',
      badgeColor: 'red',
      reviews: '52 reviews',
      isFavorite: false,
      image: 'https://images.unsplash.com/photo-1618244972963-cbba4641624c?auto=format&fit=crop&q=80&w=400',
    ),
    Product(
      brand: 'ACCENTS',
      name: 'Square Frame Acetate Shades',
      price: 160,
      reviews: '94 reviews',
      isFavorite: false,
      image: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?auto=format&fit=crop&q=80&w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopLocationBar(),
              _buildHeader(),
              _buildSearchBar(),
              _buildHeroBanner(),
              _buildCategoriesSection(),
              _buildNewArrivalsSection(),
              _buildTrendingNowSection(),
              _buildNewsletterSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- Widgets ---

  Widget _buildTopLocationBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: Colors.black87),
              SizedBox(width: 4),
              Text(
                'DELIVER TO • ',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'New York, NY 10001',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, size: 14),
            ],
          ),
          Text(
            'Express 1h Available',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 28),
          Text(
            'LOOMA',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          Row(
            children: [
              Icon(Icons.favorite_border, size: 24),
              SizedBox(width: 16),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications_none, size: 24),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey, size: 20),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Search clothes, shoes, bags...',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Icon(Icons.mic_none, color: Colors.grey, size: 20),
            SizedBox(width: 12),
            Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1549439602-43ebca2327af?auto=format&fit=crop&q=80&w=800',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.black.withValues(alpha: 0.4), Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SS + 2025 EDITION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "SUMMER '25\nESSENTIALS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Up to 40% Off Selected Editorial Cuts',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Shop Now',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'View All',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemBuilder: (context, index) {
              bool isSelected = selectedCategoryIndex == index;
              bool isSale = categories[index] == 'Sale';

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.white,
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (isSale) ...[
                        SizedBox(width: 6),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'HOT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewArrivalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Curated architectural staples',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Text(
                'View All',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: newArrivals.length,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200,
                child: _buildHorizontalProductCard(newArrivals[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalProductCard(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (product.badge != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: product.badgeColor == 'red'
                          ? Colors.red
                          : Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      product.badge!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+ Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.brand,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (product.rating != null)
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 12),
                  SizedBox(width: 2),
                  Text(
                    '${product.rating}',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          product.name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${product.price.toInt()}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 6),
            if (product.oldPrice != null)
              Text(
                '\$${product.oldPrice!.toInt()}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildTrendingNowSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Community most-loved silhouettes',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Text(
                '24 ITEMS',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          physics: NeverScrollableScrollPhysics(), // Let the main scroll view handle scrolling
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65, // Adjusted to match the image ratios
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
          ),
          itemCount: trendingProducts.length,
          itemBuilder: (context, index) {
            return _buildGridProductCard(trendingProducts[index]);
          },
        ),
      ],
    );
  }

  Widget _buildGridProductCard(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (product.badge != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: product.badgeColor == 'red'
                          ? Colors.red
                          : Colors.black,
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // Slightly different radius for bestseller tag
                    ),
                    child: Text(
                      product.badge!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black87,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(
          product.brand,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 4),
        Text(
          product.name,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\$${product.price.toInt()}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 6),
                if (product.oldPrice != null)
                  Text(
                    '\$${product.oldPrice!.toInt()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
            if (product.reviews != null)
              Text(
                product.reviews!,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewsletterSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E), // Dark grey/black
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRIVATE MEMBER ACCESS',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Receive Private Atelier Drops',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Subscribers get 12-hour early access to bespoke capsules and runway sample sales.',
              style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.4),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter email address',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Join',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
