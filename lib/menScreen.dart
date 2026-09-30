import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProductDetailsScreen.dart';

class menScreen extends StatefulWidget {
  const menScreen({super.key});

  @override
  State<menScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<menScreen> {


  final List<Map<String, dynamic>> products = [
    {
      'brand': 'LOOMA STUDIO',
      'name': 'Relaxed Fit Wool Coat',
      'price': 210,
      'oldPrice': 280,
      'rating': 4.9,
      'reviews': 124,
      'discount': 25,
      'isFavorite': false,
      'image': 'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    },
    {
      'brand': 'ESSENTIALS',
      'name': 'Relaxed Fit Heavy Tee',
      'price': 45,
      'oldPrice': null,
      'rating': 4.7,
      'reviews': 89,
      'discount': null,
      'isFavorite': true,
      'image': 'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    },
    {
      'brand': 'ARCHIVE',
      'name': 'Straight Leg Raw Denim',
      'price': 120,
      'oldPrice': 150,
      'rating': 4.8,
      'reviews': 64,
      'discount': 20,
      'isFavorite': false,
      'image': 'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    },
    {
      'brand': 'NORDIC',
      'name': 'Leather Chelsea Boots',
      'price': 195,
      'oldPrice': null,
      'rating': 4.9,
      'reviews': 210,
      'discount': null,
      'isFavorite': false,
      'image': 'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildFilterRow(),
         
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.52,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
               
                return GestureDetector(
                  onTap: () {
                    
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsScreen(),
                        ),
                      );
                    }
                  },
                  child: _buildProductCard(products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }


  Widget _buildProductCard(Map<String, dynamic> product) {
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
                    image: AssetImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Discount Badge
              if (product['discount'] != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${product['discount']}% OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              // Favorite Button
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    product['isFavorite']
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: product['isFavorite'] ? Colors.red : Colors.grey,
                    size: 18,
                  ),
                ),
              ),
              // Add to Cart Button
              Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 18,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),

        Text(
          product['brand'],
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 2),
        Text(
          product['name'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.black, size: 14),
            SizedBox(width: 4),
            Text(
              '${product['rating']}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 4),
            Text(
              '(${product['reviews']})',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${product['price'].toInt()}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 6),
            if (product['oldPrice'] != null)
              Text(
                '\$${product['oldPrice'].toInt()}',
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
}
