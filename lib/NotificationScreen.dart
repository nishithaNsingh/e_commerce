import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> userQueries = [
    {
      "name": "Alice",
      "product": "Laptop",
      "platform": "Amazon",
      "response":
      "Hi Alice, your laptop is available on Amazon. Delivery details can be checked on the platform."
    },
    {
      "name": "Bob",
      "product": "Mobile Phone",
      "platform": "Flipkart",
      "response":
      "Hi Bob, your mobile phone is available on Flipkart. Please check the stock details there."
    },
    {
      "name": "Catherine",
      "product": "Headphones",
      "platform": "eBay",
      "response":
      "Hi Catherine, your headphones are available on eBay. Check the offers section for discounts."
    },
    {
      "name": "David",
      "product": "Smartwatch",
      "platform": "Myntra",
      "response":
      "Hi David, your smartwatch is listed on Myntra. Please visit the platform for detailed specifications."
    },
    {
      "name": "Emma",
      "product": "Books",
      "platform": "Amazon",
      "response":
      "Hi Emma, your books will ship soon from Amazon. Check your order history for updates."
    },
    {
      "name": "Frank",
      "product": "Tablet",
      "platform": "Flipkart",
      "response":
      "Hi Frank, the warranty details for your tablet are available on Flipkart. Please review them there."
    },
    {
      "name": "Grace",
      "product": "Camera",
      "platform": "Amazon",
      "response":
      "Hi Grace, your camera will arrive soon. Please check Amazon for tracking information."
    },
    {
      "name": "Henry",
      "product": "Gaming Console",
      "platform": "eBay",
      "response":
      "Hi Henry, tracking details for your gaming console are available on eBay. Visit the platform for updates."
    },
    {
      "name": "Isabella",
      "product": "Shoes",
      "platform": "Myntra",
      "response":
      "Hi Isabella, exchange options for your shoes are available on Myntra. Visit the returns section for details."
    },
    {
      "name": "Jack",
      "product": "Television",
      "platform": "Flipkart",
      "response":
      "Hi Jack, your television order status is updated on Flipkart. Please check your order details."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back arrow color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userQueries.length,
          itemBuilder: (context, index) {
            final query = userQueries[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info Container
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 1.5),
                  ),
                  child: Text(
                    "Name: ${query['name']}\n"
                        "Product: ${query['product']}\n"
                        "Platform: ${query['platform']}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // Response Container
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 1.5),
                  ),
                  child: Text(
                    query['response']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotificationScreen(),
  ));
}