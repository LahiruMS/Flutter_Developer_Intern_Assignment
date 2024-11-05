import 'package:flutter/material.dart';
import 'package:flutter_developer_intern_assignment/api/api_service.dart';
import 'package:flutter_developer_intern_assignment/models/product_model.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Product>(
            future: apiService.fetchSingleProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("Product not found"),
                );
              } else {
                Product product = snapshot.data!;

                return Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.image,
                        width: screenWidth * 0.9,
                        height: screenWidth * 0.9,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 184, 210, 231),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  product.price,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.3),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: screenWidth * 0.04,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product.rating.toString(),
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04, // Responsive font size
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
