import 'package:flutter/material.dart';

class ServiceCards extends StatelessWidget {
  final List<dynamic> categories;

  const ServiceCards({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const Center(child: Text('No categories found.'));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8, // Adjust aspect ratio for better layout
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        final imageUrl = category['image'] ?? 'https://via.placeholder.com/80';
        final name = category['name'] ?? 'No Name';

        return Card(
          elevation: 0,
          color: Colors.transparent, // Make card background transparent
          child: InkWell(
            onTap: () {
              // Handle category tap
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrl,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 30, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
