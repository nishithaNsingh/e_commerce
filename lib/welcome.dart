import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<PlatformInfo> platforms = [
    //    assets/amazon.png
    // - assets/myntra.jpg
    // - assets/flipkart.png
    // - assets/ajio.png
    PlatformInfo(
      name: 'Amazon',
      image: 'assets/amazon.png',
      description: 'Discover deals and offers on Amazon.',
    ),
    PlatformInfo(
      name: 'Flipkart',
      image: 'assets/flipkart.png',
      description: 'Shop the best products on Flipkart.',
    ),
    PlatformInfo(
      name: 'Ajio',
      image: 'assets/ajio.png',
      description: 'Trendy fashion and lifestyle products.',
    ),
    PlatformInfo(
      name: 'Myntra',
      image: 'assets/myntra.jpg',
      description: 'Exclusive fashion collections at Myntra.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Our App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Our app helps you find the best deals and lowest prices on products across various platforms like Amazon, Flipkart, Myntra, and Ajio. Save time and money by discovering everything in one place!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Explore Platforms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: platforms.length,
                itemBuilder: (context, index) {
                  final platform = platforms[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(platform.name),
                          content: Text(platform.description),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            platform.image,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            platform.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlatformInfo {
  final String name;
  final String image;
  final String description;

  PlatformInfo({
    required this.name,
    required this.image,
    required this.description,
  });
}