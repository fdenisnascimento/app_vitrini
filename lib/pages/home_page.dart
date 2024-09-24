import 'package:app_de_vitrine/models/product_model.dart';
import 'package:app_de_vitrine/pages/product_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = [
    'All',
    'Chairs',
    'Lamps',
    'Clocks',
    'Candy',
    'Fork',
  ];

  int indexSelected = 0;

  List<ProductModel> products = [
    ProductModel(
        url: 'https://avatar.iran.liara.run/public',
        photo: 'assets/images/cadeira.png',
        name: 'Elegant\nWhite Chair',
        price: '\$ 200'),
    ProductModel(
        url: 'https://avatar.iran.liara.run/public',
        photo: 'assets/images/cadeira.png',
        name: 'Gold Chair',
        price: '\$ 299'),
    ProductModel(
        url: 'https://avatar.iran.liara.run/public',
        photo: 'assets/images/cadeira.png',
        name: 'Velure pouf',
        price: '\$ 199'),
    ProductModel(
        url: 'https://avatar.iran.liara.run/public',
        photo: 'assets/images/cadeira.png',
        name: 'Silver Chair',
        price: '\$ 599'),
    ProductModel(
        url: 'https://avatar.iran.liara.run/public',
        photo: 'assets/images/cadeira.png',
        name: 'Wood Chair',
        price: '\$ 799'),
  ];

  void navigateToProductDetail(ProductModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(
          productModel: model,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black), label: ''),
        const BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, color: Colors.grey),
            label: ''),
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 23, 91, 26),
                  borderRadius: BorderRadius.circular(15)),
              width: 50,
              height: 50,
              child: const Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
            label: ''),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: Colors.grey), label: ''),
        const BottomNavigationBarItem(
            icon: Icon(Icons.card_travel, color: Colors.grey), label: '')
      ]),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Furniture\nin your style',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w300,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 20),
            //card verde
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () => navigateToProductDetail(products.first),
                      child: Container(
                        height: 155,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0xFF446b53),
                            const Color(0xFF446b53).withOpacity(0.7)
                          ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      products.first.name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      products.first.price,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 24,
                    child: Image.asset(
                      products.first.photo,
                      height: 160,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: menu.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = menu[index];
                  return InkWell(
                    enableFeedback: false,
                    onTap: () {
                      setState(() {
                        indexSelected = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              index == indexSelected ? Colors.green[50] : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(item),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 240,
              child: ListView.separated(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return InkWell(
                    onTap: () {
                      navigateToProductDetail(product);
                    },
                    child: Container(
                      width: 170,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(
                            product.url,
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.price,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
