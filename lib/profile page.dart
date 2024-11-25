import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";
  final List<Product> myProducts = [
    Product(name: 'Smartphone', image: 'assets/iphone.jpg', price: 799.99),
    Product(name: 'Headphones', image: 'assets/sony.jpg', price: 49.99),
    Product(name: 'Shoes', image: 'assets/shoes.jpg', price: 69.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/raj prakrash.jpg'), // Replace with user's profile image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'My Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  final product = myProducts[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add navigation to product details if required
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});
}