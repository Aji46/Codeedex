import 'package:codeedex/view/home_page/all_product.dart';
import 'package:codeedex/view/home_page/build_runner.dart';
import 'package:codeedex/view/home_page/catogory.dart';
import 'package:codeedex/view/home_page/search.dart';
import 'package:codeedex/view_Model/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset('lib/assets/logo.png', height: 16.07, width: 16.07),
          const Text(
            "elo spares",
            style: TextStyle(fontFamily: 'Audiowide', fontSize: 24),
          ),
        ]),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Search(),
          CustomBanner(), 
            _buildCategoryCards(),
            TopCategoriesWidget(),
          ProductsList(),

          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCards() {
    return Container(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: _buildCategoryCard(
              'Bike Spare Parts',
              'lib/assets/bike.jpg',
            ),
          ),
          Expanded(
            child: _buildCategoryCard(
              'Accessories',
              'lib/assets/ass.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imageAsset) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
