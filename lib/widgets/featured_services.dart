import 'package:flutter/material.dart';

class FeaturedServices extends StatelessWidget {
  final List<dynamic> featuredServices;

  const FeaturedServices({super.key, required this.featuredServices});

  @override
  Widget build(BuildContext context) {
    if (featuredServices.isEmpty) {
      return const Center(child: Text('No featured services found.'));
    }

    return SizedBox(
      height: 250, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredServices.length,
        itemBuilder: (context, index) {
          final service = featuredServices[index];
          final imageUrl =
              service['image'] ?? 'https://via.placeholder.com/150';
          final title = service['title'] ?? 'No Title';
          final price = service['price'] ?? 0;
          final providerName =
              service['provider']?['full_name'] ?? 'Unknown Provider';

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(right: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        width: 200,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'By $providerName',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
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
