import 'package:flutter/material.dart';

class ServiceProviders extends StatelessWidget {
  final List<dynamic> serviceProviders;

  const ServiceProviders({super.key, required this.serviceProviders});

  @override
  Widget build(BuildContext context) {
    if (serviceProviders.isEmpty) {
      return const Center(child: Text('No service providers found.'));
    }

    return SizedBox(
      height: 200, // Increased height to avoid overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: serviceProviders.length,
        itemBuilder: (context, index) {
          final provider = serviceProviders[index];
          final imageUrl =
              provider['image'] ?? 'https://via.placeholder.com/150';
          final name = provider['full_name'] ?? 'No Name';

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(right: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 120, // Adjusted height
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        width: 150,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
