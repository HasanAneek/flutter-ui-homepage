import 'package:flutter/material.dart';

class ServiceCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': '🧽', 'label': 'Cleaning', 'color': Color(0xFF4A90E2)},
    {'icon': '🎨', 'label': 'Painting', 'color': Color(0xFFFF6B6B)},
    {'icon': '🔧', 'label': 'Plumbing', 'color': Color(0xFF4ECDC4)},
    {'icon': '👕', 'label': 'Laundry', 'color': Color(0xFF45B7D1)},
    {'icon': '📦', 'label': 'Shifting', 'color': Color(0xFF96CEB4)},
  ];

  ServiceCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: 80,
            margin: EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: category['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      category['icon'],
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  category['label'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
