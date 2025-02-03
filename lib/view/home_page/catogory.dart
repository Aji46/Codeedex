import 'package:flutter/material.dart';

class TopCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"name": "Alloy", "image": "lib/assets/alloy.png"},
      {"name": "Seat", "image": "lib/assets/seat.png"},
      {"name": "Tire", "image": "lib/assets/tire1.png"},
      {"name": "Engine", "image": "lib/assets/engin1.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Top Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(category["image"] ?? ""),
                        onBackgroundImageError: (_, __) => null,
                        child: category["image"] == null
                            ? Icon(Icons.image_not_supported, size: 10, color: Colors.grey[600])
                            : null,
                      ),
                      SizedBox(height: 8),
                      Text(
                        category["name"] ?? "",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
