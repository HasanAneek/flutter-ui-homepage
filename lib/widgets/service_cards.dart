import 'package:flutter/material.dart';

class ServiceCards extends StatelessWidget {
  const ServiceCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          ServiceCard(
            imageUrl:
                'https://www.onlinelogomaker.com/blog/wp-content/uploads/2024/06/eec65bd4ab07649c0ae50df011c809d9.jpg',
            rating: 4.5,
            duration: '1 hr',
            category: 'Painting',
            title: 'Home Cleaning Services at Miami, FL',
            price: '\$199',
            originalPrice: '\$248',
            providerName: 'Robert Fox',
            providerImage:
                'https://www.onlinelogomaker.com/blog/wp-content/uploads/2024/06/eec65bd4ab07649c0ae50df011c809d9.jpg',
          ),
          SizedBox(width: 16),
          ServiceCard(
            imageUrl:
                'https://www.onlinelogomaker.com/blog/wp-content/uploads/2024/06/eec65bd4ab07649c0ae50df011c809d9.jpg',
            rating: 4.5,
            duration: '1 hr',
            category: 'Painting',
            title: 'Reliable Plumbing Quick and Efficient',
            price: '\$199',
            originalPrice: '\$248',
            providerName: 'Robert Fox',
            providerImage:
                'https://www.onlinelogomaker.com/blog/wp-content/uploads/2024/06/eec65bd4ab07649c0ae50df011c809d9.jpg',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String duration;
  final String category;
  final String title;
  final String price;
  final String originalPrice;
  final String providerName;
  final String providerImage;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.duration,
    required this.category,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.providerName,
    required this.providerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with heart icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating and duration
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '• $duration • $category',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 8),

                // Price
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // Provider info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(providerImage),
                    ),
                    SizedBox(width: 8),
                    Text(
                      providerName,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
