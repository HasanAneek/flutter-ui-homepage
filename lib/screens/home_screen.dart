import 'package:flutter/material.dart';
import 'package:ui_design_task/services/api_service.dart';
import 'package:ui_design_task/widgets/custom_app_bar.dart';
import 'package:ui_design_task/widgets/custom_bottom_nav.dart';
import 'package:ui_design_task/widgets/featured_services.dart';
import 'package:ui_design_task/widgets/home_slider.dart';
import 'package:ui_design_task/widgets/service_cards.dart';
import 'package:ui_design_task/widgets/service_providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  Future<Map<String, dynamic>>? _data;

  @override
  void initState() {
    super.initState();
    _data = _fetchData();
  }

  Future<Map<String, dynamic>> _fetchData() async {
    try {
      // Fetch all data in parallel for better performance
      final results = await Future.wait([
        _apiService.fetchSliderLists(),
        _apiService.fetchCategories(),
        _apiService
            .fetchProviderLists(), // Fetch providers instead of featured services
        _apiService.fetchFeaturedServices(),
      ]);
      return {
        'sliders': results[0],
        'categories': results[1],
        'providers': results[2], // Use 'providers' key
        'featuredServices': results[3],
      };
    } catch (e) {
      // In a real app, you might want to use a logging service
      print('Failed to load data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final sliders = data['sliders'] as List<dynamic>? ?? [];
            final categories = data['categories'] as List<dynamic>? ?? [];
            final providers = data['providers'] as List<dynamic>? ?? [];
            final featuredServices =
                data['featuredServices'] as List<dynamic>? ?? [];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSlider(sliders: sliders),
                    const SizedBox(height: 16),
                    const Text(
                      'What are you looking for?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FeaturedServices(featuredServices: featuredServices),
                    const SizedBox(height: 16),
                    ServiceCards(categories: categories),
                    const SizedBox(height: 24),
                    const Text(
                      'Service Providers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ServiceProviders(
                      serviceProviders: providers,
                    ), // Pass providers list
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
