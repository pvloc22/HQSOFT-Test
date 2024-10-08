import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/components/search_bar.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../data/str_json_book.dart';
import '../model/book_model.dart';
import 'home_page.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}


// Your other imports

class _ShopPageState extends State<ShopPage> {
  final List<BookCategory> _kindBook = [
    BookCategory('Adventure', 'assets/images/adventure.png'),
    BookCategory('Social', 'assets/images/social.jpeg'),
    BookCategory('Romance', 'assets/images/romance.jpeg'),
    BookCategory('Children', 'assets/images/children.jpeg'),
    BookCategory('History', 'assets/images/history.jpeg'),
  ];

  final List<Book> _books = Book.parseBooks(jsonString);

  int _cartItemCount = 0;
  int _currentQty = 0;

  @override
  void initState() {
    super.initState();
    _loadCartItemCount();
  }

  Future<void> _loadCartItemCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cartItemCount = prefs.getInt('cartItemCount') ?? 0;
    });
  }

  Future<void> _updateCartItemCount(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cartItemCount = count;
    });
    prefs.setInt('cartItemCount', _cartItemCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 10),
            const Expanded(child: SearchBarComponent()),
            const SizedBox(width: 10),
            Stack(
              textDirection: TextDirection.rtl,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_sharp, color: kIconColor, size: 30),
                ),
                Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                        child: Text('$_cartItemCount',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(CommunityMaterialIcons.home_city_outline,
                              color: Colors.red, size: 30),
                          SizedBox(width: 10),
                          Text(
                            'All Vendor',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Shop > Actions',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                child: Image.asset(
                                  _kindBook[index].imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(_kindBook[index].name)
                          ],
                        )),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                crossAxisCount: 2,
                children: _books.map((book) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                child: Image.asset(
                                  'assets/${book.imagePath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              book.title,
                              style: const TextStyle(fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${book.price}\$',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const Text(
                                  'Quyển',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputQty(
                                  maxVal: double.maxFinite,
                                  initVal: 0,
                                  onQtyChanged: (val) {
                                    int quantity = val.toInt();
                                    _currentQty = quantity;
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_cart),
                                  onPressed: () {
                                    setState(() {
                                      _cartItemCount += _currentQty;
                                      _updateCartItemCount(_cartItemCount);// Cộng số lượng hiện tại vào tổng giỏ hàng
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
