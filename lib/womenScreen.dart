import 'package:flutter/material.dart';


// --- Data Model ---
class CategoryItem {
  final String title;
  final int itemCount;
  final String imageUrl;

  CategoryItem({
    required this.title,
    required this.itemCount,
    required this.imageUrl,
  });
}

class womenScreen extends StatefulWidget {
  const womenScreen({super.key});

  @override
  State<womenScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<womenScreen> {

  final List<CategoryItem> _categories = [
    CategoryItem(
      title: 'T-Shirts',
      itemCount: 148,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Shirts',
      itemCount: 94,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Jeans & Denim',
      itemCount: 112,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Jackets & Coats',
      itemCount: 76,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Dresses',
      itemCount: 85,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Shoes & Sneakers',
      itemCount: 62,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Bags & Leather Goods',
      itemCount: 49,
      imageUrl:'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Watches & Jewelry',
      itemCount: 38,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Accessories',
      itemCount: 120,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
    CategoryItem(
      title: 'Hoodies & Sweats',
      itemCount: 67,
      imageUrl: 'assets/images/d3d4cd7aa3197f049033434409b921f11fc963c9.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
          
             Divider(height: 1, color: Colors.black12),
            
        
            Expanded(
              child: SingleChildScrollView(
                padding:  EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    _buildCollectionHeader(),
                    _buildCategoriesGrid(),
                    _buildPromoBanner(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widgets ---



  Widget _buildCollectionHeader() {
    return Padding(
      padding:  EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'COLLECTIONS',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              letterSpacing: 1,
            ),
          ),
          Text(
            '${_categories.length} Categories Available',
            style:  TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // --- THE GRID VIEW ---
  Widget _buildCategoriesGrid() {
    return GridView.builder(
      padding:  EdgeInsets.symmetric(horizontal: 16),
     
      physics:  NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 0.75,
        crossAxisSpacing: 12, 
        mainAxisSpacing: 12, 
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
              ),

             
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 80,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${category.itemCount} ITEMS',
                            style:  TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(height: 2),
                          Text(
                            category.title,
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                     Icon(
                      Icons.chevron_right,
                      color: Colors.white70,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding:  EdgeInsets.all(16.0),
      child: Container(
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset:  Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'MEMBER ACCESS',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                   SizedBox(height: 4),
                   Text(
                    'Curated Archive Drops',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 4),
                  Text(
                    'Exclusive seasonal capsules releases.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child:  Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}