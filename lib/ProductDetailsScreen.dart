import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedImageIndex = 0;
  int _selectedColorIndex = 0;
  String _selectedSize = 'M';
  int _quantity = 1;

  final List<String> _images = [
    'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
    'assets/images/318bd142c6a1738706d6432d39c433418ff898b4.jpg',
  ];

  final List<Color> _colors = [
    const Color(0xFF4A4E51), 
    const Color(0xFFB08D57), 
    Colors.black,
  ];

  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageGallery(context),
                     SizedBox(height: 16),
                    _buildProductInfo(),
                     SizedBox(height: 16),
                    _buildColorSelector(),
                     SizedBox(height: 16),
                    _buildSizeSelector(),
                     SizedBox(height: 16),
                    _buildQuantitySelector(),
                     SizedBox(height: 16),
                    _buildShippingBanner(),
                     SizedBox(height: 8),
                    _buildDropdownSections(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

 
  Widget _buildImageGallery(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Image.asset(
                _images[_selectedImageIndex],
                fit: BoxFit.cover,
              ),
            ),
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: IconButton(
                      icon:  Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: IconButton(
                          icon:  Icon(
                            Icons.share_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                       SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: IconButton(
                          icon:  Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_selectedImageIndex + 1}/${_images.length}',
                  style:  TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
         SizedBox(height: 12),
       
        SizedBox(
          height: 60,
          child: ListView.separated(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _images.length,
            separatorBuilder: (context, index) =>  SizedBox(width: 8),
            itemBuilder: (context, index) {
              bool isSelected = _selectedImageIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: AssetImage(_images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget _buildProductInfo() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'LOOMA STUDIO',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'FW24 COLLECTION',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
           SizedBox(height: 4),
           Text(
            'Minimal Wool Overcoat',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 6),
          Row(
            children: [
               Icon(Icons.star, color: Colors.black, size: 14),
               SizedBox(width: 4),
               Text(
                '4.9',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
               SizedBox(width: 6),
               Text('•', style: TextStyle(color: Colors.grey)),
               SizedBox(width: 6),
              Text(
                'View all 124 reviews',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
           SizedBox(height: 12),
          Row(
            children: [
               Text(
                r'$210',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
               SizedBox(width: 8),
              Text(
                r'$280',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
               SizedBox(width: 8),
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color:  Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(4),
                ),
                child:  Text(
                  '25% OFF',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildColorSelector() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Color: Charcoal Grey',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Text(
                '3 shades',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
           SizedBox(height: 8),
          Row(
            children: List.generate(_colors.length, (index) {
              bool isSelected = _selectedColorIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin:  EdgeInsets.only(right: 12),
                  padding:  EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: _colors[index],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }


  Widget _buildSizeSelector() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Row(
                children:  [
                  Icon(Icons.straighten, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Size Guide',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
           SizedBox(height: 8),
          Row(
            children: _sizes.map((size) {
              bool isSelected = _selectedSize == size;
              bool isUnavailable = size == 'XXL'; 

              return Expanded(
                child: GestureDetector(
                  onTap: isUnavailable
                      ? null
                      : () {
                          setState(() {
                            _selectedSize = size;
                          });
                        },
                  child: Container(
                    height: 40,
                    margin:  EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      border: Border.all(
                        color: isUnavailable
                            ? Colors.grey.shade200
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      size,
                      style: TextStyle(
                        color: isUnavailable
                            ? Colors.grey.shade300
                            : (isSelected ? Colors.white : Colors.black),
                        fontWeight: FontWeight.w500,
                        decoration: isUnavailable
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }


  Widget _buildQuantitySelector() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            'Quantity',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon:  Icon(Icons.remove, size: 16),
                  onPressed: () {
                    if (_quantity > 1) setState(() => _quantity--);
                  },
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$_quantity',
                    style:  TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon:  Icon(Icons.add, size: 16),
                  onPressed: () {
                    setState(() => _quantity++);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildShippingBanner() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding:  EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Row(
              children: [
                 Icon(
                  Icons.local_shipping_outlined,
                  size: 18,
                  color: Colors.black87,
                ),
                 SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Free Express Shipping on orders over \$150',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Estimated Delivery: Oct 24 – Oct 26',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(height: 1, color: Colors.black12),
            ),
            Row(
              children: [
                 Icon(Icons.refresh, size: 18, color: Colors.black87),
                 SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Complimentary 30-Day Returns',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Prepaid return shipping label included in every box.',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDropdownSections() {
    return Column(
      children: [
        _buildExpansionTile('Composition & Care'),
        _buildExpansionTile('Product Specifications'),
        _buildExpansionTile('Sustainability'),
      ],
    );
  }

  Widget _buildExpansionTile(String title) {
    return ExpansionTile(
      title: Text(
        title,
        style:  TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,
      children: [
        Padding(
          padding:  EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Details regarding $title go here. Crafted with premium materials designed for longevity and comfort.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

 
  Widget _buildBottomBar() {
    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon:  Icon(Icons.bookmark_border, color: Colors.black),
              onPressed: () {},
            ),
          ),
           SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon:  Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
           SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:  EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:  Text(
                'Add to Cart • \$210',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
