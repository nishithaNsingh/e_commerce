import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _platformController = TextEditingController();

  List<Product> allProducts = [
    Product(
        name: 'iphone 15',
        price: '\₹65,900',
        platform: 'Amazon',
        image: 'assets/iphone.jpg',
        url: 'https://www.amazon.in/Apple-iPhone-15-128-GB/dp/B0CHX2F5QT/ref=sr_1_1_sspa?crid=13Q0170T9C544&dib=eyJ2IjoiMSJ9.4Amcm6ymShwYf2cUNy6g86WDoB5h-9C6cHAj-CJcKnhhDPQn-fIYfKJxxKAv6p4v-rFk58HVcBYHNhj9jg5iOAyUMKB6IXW43PTJF5S_Zx41nz2N2K05yaOtdB8nvWdprbvGpePNuH2CS-0lyaEQvYaQXjc-TAELb-6-XS8gqV76alWLdStfqjUVOX3WXDiglRbx8clGs8UXnnFrj-S34p1e5-0EV8yHjQGPVjrLVGg.v16vXl3IK3D574Jb8-oQ2VbLHx15u5Hz2bVxkryQBWY&dib_tag=se&keywords=iphone+15&qid=1732024549&sprefix=iphone+15%2Caps%2C259&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1'),
    Product(
        name: 'iphone 15',
        price: '\₹58,499',
        platform: 'Flipkart',
        image: 'assets/iphone.jpg',
        url: 'https://www.flipkart.com/apple-iphone-15-blue-128-gb/p/itmbf14ef54f645d?pid=MOBGTAGPAQNVFZZY&lid=LSTMOBGTAGPAQNVFZZYQRLPCQ&marketplace=FLIPKART&q=iphone15&store=tyy%2F4io&spotlightTagId=BestsellerId_tyy%2F4io&srno=s_1_4&otracker=search&otracker1=search&fm=Search&iid=d360b4fb-c957-42d7-b0dd-ef9fecbad106.MOBGTAGPAQNVFZZY.SEARCH&ppt=sp&ppn=sp&ssid=uic80q9ca80000001732024932783&qH=1827ac0d826493c5'),
    Product(
        name: 'Headphones',
        price: '\ ₹9,871',
        platform: 'Amazon',
        image: 'assets/sony.jpg',
        url: 'https://www.amazon.in/Sony-Cancellation-Headphones-Multi-Point-Connection/dp/B0BS1QCFHX/ref=sr_1_5?crid=2SHF0XKIBF5O4&dib=eyJ2IjoiMSJ9.P1M5HDkWX88HR_Oqs0LvhQGwo6Ix-LyInPFt0mESoyBji9Rqrv7daEWM_PD88b0R5Ld1_IqwWMB01zemw8CTeQOaN7U7xFXdAc6a4xrhi74rGAA4PG5gjUkT3S7vyEB1xxGHfuV425InguWZsSYBdIr3p2T4kIyz491JfPwTE8mfBOEr98Bdq-g3pzUmeKCDxDqgkEtAWAqi0BdxHUnLfvbDBO0AUU6hcKYvppylgL8.9TfRvbVQQ5TjsX7qvFJ4B3tKVI11G5ZjChbn0kpAlGg&dib_tag=se&keywords=Headphones+sony&nsdOptOutParam=true&qid=1732025116&sprefix=headphones+son%2Caps%2C268&sr=8-5'),
    Product(
        name: 'Headphones',
        price: '\₹22,990',
        platform: 'Flipkart',
        image: 'assets/sony.jpg',
        url: 'https://www.flipkart.com/sony-wh-1000xm4-bluetooth/p/itm9f84f49ad6ac8?pid=ACCGCVGXQGFUNXTN&lid=LSTACCGCVGXQGFUNXTNMNI87P&marketplace=FLIPKART&q=Headphones+sony+Sony+WH-CH720N%2C&store=0pm%2Ffcn%2Fgc3%2Fka8&spotlightTagId=TrendingId_0pm%2Ffcn%2Fgc3%2Fka8&srno=s_1_14&otracker=search&otracker1=search&fm=Search&iid=69035a9b-9ddb-4449-b32e-7281d1a7c6cd.ACCGCVGXQGFUNXTN.SEARCH&ppt=sp&ppn=sp&ssid=6yl6xfazi80000001732025256817&qH=7b4092c58dcc532e'),
    Product(
        name: 'T-Shirt',
        price: '\₹499',
        platform: 'Amazon',
        image: 'assets/shirt.jpg',
        url: 'https://www.amazon.in/FN3-Zipper-Sweatshirt-Polyester-Modern/dp/B0DF69NJ2R/?_encoding=UTF8&pd_rd_w=Ly2Ud&content-id=amzn1.sym.e8531dbd-bba2-4195-85f1-c2bcfebc1303%3Aamzn1.symc.9b8fba90-e74e-4690-b98f-edc36fe735a6&pf_rd_p=e8531dbd-bba2-4195-85f1-c2bcfebc1303&pf_rd_r=1V9P0WEFPJ8AJD6SSQV8&pd_rd_wg=PKYBv&pd_rd_r=74267195-499b-4718-8bf5-0cf45d314c38&ref_=pd_hp_d_btf_ci_mcx_mr_ca_id_hp_d'),
    Product(
        name: 'Washing Machine',
        price: '\₹36,990',
        platform: 'Amazon',
        image: 'assets/washing.jpeg',
        url: 'https://www.amazon.in/LG-Inverter-Fully-Automatic-FHP1208Z3M-Technology/dp/B0C3LNLFXY/ref=sr_1_1_sspa?crid=2XPK68M1HLWLO&dib=eyJ2IjoiMSJ9.CjFHk4TvCAxHtybm69yHkX4n48CYarsfFldsNOY4tuG3DYK4Bbed3p9-wr0VS64aChABH4-iQRwXqjYsu6ZynOoMK7C4_44xAhM440hb-cXWwz593qUpApC0b-Ib8w4_zHjuI9tvqoRjzsfMVZIubKznJyFx7IQPx5OyKJB24hWVBU6ncFmei0AEh8EAqU1-IXqmkXyx6Z0Vs0qjC_eyq18kYkMQzTPv6BginV9gQgQ.mzi0XzzEoJiDlPJDguC8QHZp7VQ4cp0uTccdT9EYMDw&dib_tag=se&keywords=washing+machine+7kg&qid=1732025471&sprefix=washing+machine+7kg%2Caps%2C253&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1'),
    Product(
        name: 'Refrigerator(LG 655 L)',
        price: '\₹74,990',
        platform: 'Amazon',
        image: 'assets/firdege.webp',
        url: 'https://www.amazon.in/LG-Frost-Free-Inverter-Refrigerator-GL-B257HDSY/dp/B0BX4FBVQB/ref=sxin_15_pa_sp_search_thematic_sspa?content-id=amzn1.sym.cd33fa60-47cd-49f3-80b8-24b1f0cbef97%3Aamzn1.sym.cd33fa60-47cd-49f3-80b8-24b1f0cbef97&crid=1UEESDDHIA4HD&cv_ct_cx=Refrigerator&dib=eyJ2IjoiMSJ9.y_SDGraMlJEa7f-soiv7G86NUuNuxTaqbmIVOWexwCRYzYOcCaxUbrMqIMfiwrcC4CS3Asf-5UmTalrp1X26wA.ut1H-IbWR0ATjCUApCkY8BMWjt19bMNKfBPVI5J7_Rs&dib_tag=se&keywords=Refrigerator&pd_rd_i=B0BX4FBVQB&pd_rd_r=7be52128-0aa8-4a44-ad42-0f618a9a3898&pd_rd_w=Je1jp&pd_rd_wg=X827v&pf_rd_p=cd33fa60-47cd-49f3-80b8-24b1f0cbef97&pf_rd_r=7K9SPXKWQ2Y5V17M7Q38&qid=1732025548&sbo=RZvfv%2F%2FHxDF%2BO5021pAnSA%3D%3D&sprefix=%2Caps%2C249&sr=1-1-ced4eeeb-b190-41d6-902a-1ecb3fb8b7c4-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9zZWFyY2hfdGhlbWF0aWM&th=1'),
    Product(
        name: 'Watch',
        price: '\₹578',
        platform: 'Amazon',
        image: 'assets/watch.jpg',
        url: 'https://www.amazon.in/Like-Beautiful-Bluetooth-Calling-Interactions/dp/B0CV9TQQC9/ref=sr_1_41?dib=eyJ2IjoiMSJ9.3pgNbAxjQeJkvVPAaZN3RR34jiWW2aZgCYRKTM6MDo8CyyxA0JKGhSPebS2j-KPxU-xZZZhzLksu_dLDoBD82Iurd_SHPbN2ZJ9FJZcNvVa0Pp7K5HOsbuz9Dgi0c9ikS6nVtNff3ISqnKzbfBACUs06QWM4CUsBA85SuUN7ueNQtai9hcOmsnWnqr46Z0fakbLY2vJP8kUYj_ljm91bphKUvTT-JsrLjmFnJ3g-tqqJxptHdNXv3QAVEhzkup8qtzz5f8JEaQQmfOe-MzsO18M0j9kZtj2QSABGhSzpVnw.UcEscy1FL61U13GVBgHhIiLYBU8cGcMvL6WS5-ol8W0&dib_tag=se&keywords=Watch&qid=1732025634&sr=8-41&th=1'),
    Product(
        name: 'Sunglasses',
        price: '\₹499',
        platform: 'Amazon',
        image: 'assets/glass.jpeg',
        url: 'https://www.amazon.in/Exclusive-Polarized-Sunglasses-Protected-NEX-RTGRY/dp/B0D7SMYTNX/ref=sr_1_18?crid=2XR9HOA14GTJR&dib=eyJ2IjoiMSJ9.CDSFrgpWqtqoLkrGH7WimNHyjqz7JT2Y3jHtpDvHNhk9ifKyWhYkFnFviV-_tP1Fln0Nr4I3tSuwR0_c-QpTghusRFTcBtAIlnlE3V0R1p--S_GdBvW8Y3aWELTnfv4Wem1nm38wUlRYPeFypBxbj3yPIUPeL2TtGTihF_sozNTnw9K_tSvlt8u80hkPno4uygaB3yfvxH2WzTC52cONO40CjZD2xl6I8BiGc0APEiHb5F0MdPW4gtOx7A-jbuby5-K1ogKQnvGuiVauOQRK2zYf6QtkX1oHYOyrH7SSvv0.awkNJ31j-Agz5NsO2SXttYNfZg2792SJpimiZO2Q-vY&dib_tag=se&keywords=Sunglasses&qid=1732025705&sprefix=sunglasses%2Caps%2C220&sr=8-18'),
    Product(
        name: 'Camera',
        price: '\₹1,60,019',
        platform: 'Amazon',
        image: 'assets/camera.jpg',
        url: 'https://www.amazon.in/Canon-Mirrorless-Digital-RF-S18-150mm-Stabilisation/dp/B0B2KSD7WW/ref=sr_1_4?crid=3A39WTI51GBUZ&dib=eyJ2IjoiMSJ9.XmgwsSY8gtz4JtXshnuyzrwJ5DbwtWtaxn_PpoAo1ut7BF6tIgmiFkSe0wD3S7mkiNYy5TBZbNkNumVQC3tElFaVuCuC3z9Hc9FyZVIoZvUJ1apoiX09LXAIKeOrCwBgrJpC2EQGQRYZJftqaBl8B4478U7CMk7C9K1Q7av1y4EIcwpQPnwE64Ar850gpa_MBTnHvIDhImt7Ndc6FWVemY4WXkKVlP2iFsCMM7x3gso.ImhHuk0LYFmKMn3C2zILJPuisX6gZ9ZKJNaZyzSP34k&dib_tag=se&keywords=canon+camera+dslr&nsdOptOutParam=true&qid=1732025789&sprefix=canon+ca%2Caps%2C224&sr=8-4'),
    Product(
        name: 'Samsung Galaxy Z',
        price: '\₹92,999',
        platform: 'Amazon',
        image: 'assets/z fold.png',
        url: 'https://www.amazon.in/Canon-Mirrorless-Digital-RF-S18-150mm-Stabilisation/dp/B0B2KSD7WW/ref=sr_1_4?crid=3A39WTI51GBUZ&dib=eyJ2IjoiMSJ9.XmgwsSY8gtz4JtXshnuyzrwJ5DbwtWtaxn_PpoAo1ut7BF6tIgmiFkSe0wD3S7mkiNYy5TBZbNkNumVQC3tElFaVuCuC3z9Hc9FyZVIoZvUJ1apoiX09LXAIKeOrCwBgrJpC2EQGQRYZJftqaBl8B4478U7CMk7C9K1Q7av1y4EIcwpQPnwE64Ar850gpa_MBTnHvIDhImt7Ndc6FWVemY4WXkKVlP2iFsCMM7x3gso.ImhHuk0LYFmKMn3C2zILJPuisX6gZ9ZKJNaZyzSP34k&dib_tag=se&keywords=canon+camera+dslr&nsdOptOutParam=true&qid=1732025789&sprefix=canon+ca%2Caps%2C224&sr=8-4'),
    Product(
        name: 'OnePlus Nord ',
        price: '\₹20,500',
        platform: 'FlipKart',
        image: 'assets/on epluse.png',
        url: 'https://www.flipkart.com/oneplus-nord-ce-3-lite-5g-chromatic-gray-256-gb/p/itm2cd5a4e659035?pid=MOBGZJ45PS4AQ7BA&lid=LSTMOBGZJ45PS4AQ7BADCYZJR&marketplace=FLIPKART&q=one+pluse+&store=search.flipkart.com&srno=s_1_13&otracker=search&otracker1=search&fm=Search&iid=8d6f4fe5-c36c-4d86-9588-41ee01536836.MOBGZJ45PS4AQ7BA.SEARCH&ppt=sp&ppn=sp&ssid=7zarwyn68g0000001732026052935&qH=e594f3e0aff65769'),
    Product(
        name: 'Apple Watch ',
        price: '\₹49,899',
        platform: 'flipkart',
        image: 'assets/i watch.jpg',
        url: 'https://www.flipkart.com/apple-watch-series-10-gps-46mm-jet-black-aluminium-sport-band/p/itm186d892337bc4?pid=SMWH4JBWQZTFDFJ4&lid=LSTSMWH4JBWQZTFDFJ4O1IKAL&marketplace=FLIPKART&q=apple+watch&store=ajy%2Fbuh&srno=s_1_1&otracker=search&otracker1=search&fm=Search&iid=76e08e69-51c2-4190-bf56-ad978cbbc724.SMWH4JBWQZTFDFJ4.SEARCH&ppt=sp&ppn=sp&ssid=92iapct9s00000001732026287874&qH=ac1abc0e63e8442c'),
    Product(
        name: 'Apple Watch',
        price: '\₹49,900',
        platform: 'Amazon',
        image: 'assets/i watch.jpg',
        url: 'https://www.amazon.in/Apple-Watch-Black-Aluminium-Sport/dp/B0DGJ8C52J/ref=sr_1_3?crid=3Q0AJTZGIKQQH&dib=eyJ2IjoiMSJ9.UmziZLAwErIzkQCKpwuxY1zchsTpDNCz0q4-2hoQ0LlDq-_yA4nriXSoxnBwQKkrj6loCYw1uCuve5IRcMPD0m8eDaR8LDvLyN0bCYwhHO5zaxouHlD_-zHw4vaILa2iihQ_48WeFjP6temjF6EgUs5BSzdUIKCR0IyCeN-HyAhLDmOhkEggKOLe88aAlyXZ9zGZ6f2-Nvvre4DRL_8mdRH-1cGPd4ap0blWuVMPPuM.YAbkJvWZlKD2ftUYdDTOxCdrj8oG5_kOgegQHvtCr1U&dib_tag=se&keywords=Apple%2BWatch%2BSeries&nsdOptOutParam=true&qid=1732026454&sprefix=apple%2Bwatch%2Bseries%2B%2Caps%2C236&sr=8-3&th=1'),
    Product(
        name: 'Rigo',
        price: '\₹447',
        platform: 'Myntra',
        image: 'assets/myntra1.webp',
        url: 'https://www.myntra.com/tshirts/rigo/rigo-men-yellow-cotton-casual-t-shirt/25181302/buy'),
    Product(
        name: 'Hooded',
        price: '\₹899',
        platform: 'Myntra',
        image: 'assets/hoodie.webp',
        url: 'https://www.myntra.com/sweatshirts/clafoutis/clafoutis-men-printed-hooded-sweatshirt/31569475/buy'),
    Product(
        name: 'Allen Solly',
        price: '\₹1393',
        platform: 'Myntra',
        image: 'assets/allen.jpg',
        url: 'https://www.myntra.com/shirts/allen+solly/allen-solly-slim-fit-self-design-textured-button.dart-down-collar-pure-cotton-formal-shirt/24415204/buy'),
    Product(
        name: 'Allen Solly',
        price: '\₹3,114',
        platform: 'Ajio',
        image: 'assets/allen.jpg',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Hooded',
        price: '\₹760',
        platform: 'Ajio',
        image: 'assets/hoodie.webp',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'U.S. POLO',
        price: '\₹1,350',
        platform: 'Ajio',
        image: 'assets/us plolo.png',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Puma',
        price: '\₹611',
        platform: 'Myntra',
        image: 'assets/puma.webp',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Puma',
        price: '\₹₹595',
        platform: 'Ajio',
        image: 'assets/puma.webp',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'NIKE Shoes',
        price: '\₹2,623',
        platform: 'Ajio',
        image: 'assets/nike.png',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'NIKE Shoes',
        price: '\₹3695',
        platform: 'Ajio',
        image: 'assets/nike.png',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Linen Club',
        price: '\₹1424',
        platform: 'Ajio',
        image: 'assets/new shirt.jpg',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Linen Club',
        price: '\₹1,350',
        platform: 'Ajio',
        image: 'assets/new shirt.jpg',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Samsung Galaxy Z',
        price: '\₹1,35500',
        platform: 'flipkart',
        image: 'assets/z fold.png',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'OnePlus Nord',
        price: '\₹22,000',
        platform: 'Amazon',
        image: 'assets/on epluse.png',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
    Product(
        name: 'Rigo',
        price: '\₹1,350',
        platform: 'Ajio',
        image: 'assets/myntra1.webp',
        url: 'https://www.ajio.com/allen-solly-men-checked-slim-fit-shirt/p/469611601_green'),
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
      product.name.toLowerCase().contains(query) || query.isEmpty)
          .toList();
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  void _submitForm() {
    final userName = _userNameController.text;
    final productName = _productNameController.text;
    final platform = _platformController.text;

    if (userName.isNotEmpty && productName.isNotEmpty && platform.isNotEmpty) {
      // Store data in Firebase Realtime Database
      final database = FirebaseDatabase.instance.ref();
      database.child("users").push().set({
        'user_name': userName,
        'product_name': productName,
        'platform': platform,
      }).then((_) {
        print("Data stored successfully");
        // Show success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Form Submitted'),
            content: Text(
                'User: $userName\nProduct: $productName\nPlatform: $platform'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );

        // Clear the form fields
        _userNameController.clear();
        _productNameController.clear();
        _platformController.clear();
      }).catchError((error) {
        print("Failed to store data: $error");
      });
    } else {
      // Show error if any field is empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for products',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterProducts();
              },
            ),
            SizedBox(height: 10),
            filteredProducts.isEmpty
                ? Column(
              children: [
                Text(
                  'No products found',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _platformController,
                  decoration: InputDecoration(
                    labelText: 'Platform Needed',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            )
                : GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(product.url),
                        child: Image.asset(
                          product.image,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              product.price,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Available on: ${product.platform}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}

class Product {
  final String name;
  final String price;
  final String platform;
  final String image;
  final String url;

  Product({
    required this.name,
    required this.price,
    required this.platform,
    required this.image,
    required this.url,
  });
}