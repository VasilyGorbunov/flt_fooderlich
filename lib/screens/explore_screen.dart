import 'package:flt_fooderlich/api/mock_fooderlich_service.dart';
import 'package:flt_fooderlich/models/explore_data.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return Center(
            child: Container(
              child: const Text('Show TodayRecipe'),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
