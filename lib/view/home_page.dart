import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../model/book_model.dart';
import 'components/bottomnavigatorbar.dart';
import 'components/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../data/str_json_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  final List<String> _logos = [
    'assets/images/logo1.jpeg',
    'assets/images/logo2.png',
    'assets/images/logo3.jpeg',
    'assets/images/logo4.jpeg',
    'assets/images/logo5.jpeg',
    'assets/images/logo6.png',
  ];

  final List<Book> _books = Book.parseBooks(jsonString);
  int _cartItemCount = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,

        centerTitle: true,
        title: const Text('nRetail', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions:  [
          Stack(
            textDirection: TextDirection.rtl,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: kIconColor, size: 30,),
              ),
              Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Center(child: Text('${_cartItemCount}', style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),)),
                ),
              )
            ],
          ),
          Stack(
            textDirection: TextDirection.rtl,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: kIconColor, size: 30,),
              ),
              Container(
                height: 17,
                width: 17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: const Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Center(child: Text('5', style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),)),
                      ),
                  )
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // Adjust the height as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SearchBarComponent(), // Include your search bar component here
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding ),
            child: Column(
              children: [

                CarouselSlider(
                  items:[
                    // borderRadius: BorderRadius.circular(20.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/banner1.jpg', fit: BoxFit.cover,)
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover,)
                      ),
                    ),

                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height/4,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index; // Cập nhật chỉ số hiện tại
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: 2, // Số lượng item
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 3,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const SizedBox(height: 10),

                Divider(
                  color: Colors.grey,
                  thickness: 3,
                ),

                Container(
                    child:Column(
                      children:[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('CONNECTED VENDERS', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFae0001)
                              ),),
                              Container(
                                child: Row(
                                  children: [
                                    Text('View more'),
                                    Icon(Icons.navigate_next),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1, // Chiều cao của ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // Hướng cuộn là ngang
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 100, // Chiều rộng cho từng item
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), // Bo góc
                                  ),
                                  child: ClipRRect(
                                    child: Image.asset(_logos[index], fit: BoxFit.cover,),
                                  )
                                  ),
                              );
                            },
                          ),
                        ),
                      ]
                    )
                ),

                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 3,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('BOUGHT PRODUCTS', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFae0001)
                        ),),
                        Container(
                          child: Row(
                            children: [
                              Text('View more'),
                              Icon(Icons.navigate_next),
                            ],
                          ),
                        )
                      ],
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height * 0.2, // Chiều cao của ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Hướng cuộn là ngang
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100, // Chiều rộng cho từng item
                                margin: EdgeInsets.symmetric(horizontal: 8), // Khoảng cách giữa các item
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Bo góc
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(child: Image.asset('assets/${_books[index].imagePath}', fit: BoxFit.cover,)),
                                      Text('${_books[index].title}', textAlign: TextAlign.center,),
                                      Text('${_books[index].price} \$', textAlign: TextAlign.center,style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2, // Chiều cao của ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Hướng cuộn là ngang
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 100, // Chiều rộng cho từng item
                                  margin: EdgeInsets.symmetric(horizontal: 8), // Khoảng cách giữa các item
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), // Bo góc
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(child: Image.asset('assets/${_books[index+10].imagePath}', fit: BoxFit.cover,)),
                                      Text('${_books[index+10].title}', textAlign: TextAlign.center,),
                                      Text('${_books[index+10].price}\$', textAlign: TextAlign.center,style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
      // backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigatorBarNRetail(initIndex: 0),
    );

  }
}
