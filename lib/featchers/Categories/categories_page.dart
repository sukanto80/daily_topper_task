import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  // Sample data for the categories
  final List<Map<String, String>> categories = [
    {'image': 'assets/images/international.jpg', 'label': 'International'},
    {'image': 'assets/images/national.jpg', 'label': 'National'},
    {'image': 'assets/images/sports.png', 'label': 'Sports'},
    {'image': 'assets/images/politics.jpg', 'label': 'Politics'},
    {'image': 'assets/images/finance.jpg', 'label': 'Finance'},
    {'image': 'assets/images/entertainment.jpg', 'label': 'Entertainment'},
    {'image': 'assets/images/international.jpg', 'label': 'International'},
    {'image': 'assets/images/national.jpg', 'label': 'National'},
    {'image': 'assets/images/sports.png', 'label': 'Sports'},
    {'image': 'assets/images/politics.jpg', 'label': 'Politics'},
    {'image': 'assets/images/finance.jpg', 'label': 'Finance'},
    {'image': 'assets/images/entertainment.jpg', 'label': 'Entertainment'},
    {'image': 'assets/images/international.jpg', 'label': 'International'},
    {'image': 'assets/images/national.jpg', 'label': 'National'},
    {'image': 'assets/images/sports.png', 'label': 'Sports'},
    {'image': 'assets/images/politics.jpg', 'label': 'Politics'},
    {'image': 'assets/images/finance.jpg', 'label': 'Finance'},
    {'image': 'assets/images/entertainment.jpg', 'label': 'Entertainment'},

    // Repeat as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.85, // Adjust as per your needs
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              image: categories[index]['image']!,
              label: categories[index]['label']!,
            );
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  CategoryItem({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
