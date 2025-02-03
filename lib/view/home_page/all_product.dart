import 'package:codeedex/view/product_detaile/product_detaile.dart';
import 'package:codeedex/view_Model/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<HomeViewModel>(context, listen: false).fetchProducts();
                  },
                  child: Text('Refresh'),
                ),
              ],
            ),
          ),
          Consumer<HomeViewModel>(
            builder: (context, homeViewModel, child) {
              if (homeViewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (homeViewModel.error != null) {
                return Center(child: Text(homeViewModel.error!));
              }

              double screenWidth = MediaQuery.of(context).size.width;

              int crossAxisCount = screenWidth < 600 ? 2 : 4;

              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: homeViewModel.products.length,
                itemBuilder: (context, index) {
                  final product = homeViewModel.products[index];
                  return GestureDetector(
                    onTap: () {
  // Navigate to the product detail page
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(
        productId: product.id.toString(),
        productPrice: product.price.toString(), // Pass the product price here
      ),
    ),
  );
},

                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                            child: Image.network(
                              product.partImage,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.partsName ?? 'No Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
