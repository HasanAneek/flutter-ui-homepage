import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/post_job_section.dart';
import '../widgets/promotional_banner.dart';
import '../widgets/service_cards.dart';
import '../widgets/service_categories.dart';
import '../widgets/service_providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Custom App Bar
          CustomAppBar(),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ServiceCategories(),
                  SizedBox(height: 24),
                  ServiceCards(),
                  SizedBox(height: 24),
                  PromotionalBanner(),
                  SizedBox(height: 24),
                  ServiceProviders(),
                  SizedBox(height: 24),
                  PostJobSection(),
                  SizedBox(height: 100), // Space for bottom nav
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
