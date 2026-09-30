import 'package:flutter/material.dart';
import 'package:flutter_application_1/menScreen.dart';
import 'package:flutter_application_1/womenScreen.dart';



class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Women', 'Men', 'Unisex', 'Sale & Offers'];

  final List<Widget> _tabViews = [
    const womenScreen(),

    const menScreen(),

    
     Center(
      child: Text(
        'Unisex Categories Content',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),

  
     Center(
      child: Text(
        'Sale & Offers Content',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildTabs(), 
             Divider(height: 1, color: Colors.black12),

           
            Expanded(child: _tabViews[_selectedTabIndex]),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Icon(Icons.menu, size: 28),
           Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children:  [
              Icon(Icons.search, size: 24),
              SizedBox(width: 16),
              Icon(Icons.tune, size: 24),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildTabs() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        separatorBuilder: (context, index) =>  SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = _selectedTabIndex == index;
          final isSale = _tabs[index] == 'Sale & Offers';

          return GestureDetector(
            onTap: () {
              setState(() {
              
                _selectedTabIndex = index;
              });
            },
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 16),
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
                  if (isSale) ...[
                    Container(
                      width: 6,
                      height: 6,
                      decoration:  BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                     SizedBox(width: 6),
                  ],
                  Text(
                    _tabs[index],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (isSale ? Colors.red : Colors.black),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
