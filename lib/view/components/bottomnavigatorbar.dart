import 'package:flutter/material.dart';
import 'package:untitled1/view/components/image_bottom_navigator.dart';
import 'package:untitled1/view/home_page.dart';

import '../shop_page.dart';

class BottomNavigatorBarNRetail extends StatefulWidget{
  final int initIndex;

  const BottomNavigatorBarNRetail({super.key, required this.initIndex});

  @override
  State<BottomNavigatorBarNRetail> createState() => _BottomNavigatorBarNRetailState();
}

class _BottomNavigatorBarNRetailState extends State<BottomNavigatorBarNRetail> {
  late int _selectedIndex;
  @override
  void initState(){
    super.initState();
    _selectedIndex = widget.initIndex;
  }
  void _onItemTapped(int index) {
    if(index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShopPage()));
        break;
      case 2:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllTasksScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _selectedIndex != 0 ? ImageAsset(path: 'assets/icon/ic_bot_homepage.png',): ImageAsset(path: 'assets/icon/ic_bot_homepage_focus.png',),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex != 1 ? ImageAsset(path: 'assets/icon/ic_bot_category.png',): ImageAsset(path: 'assets/icon/ic_bot_category_focus.png',),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex != 2? ImageAsset(path: 'assets/icon/ic_bot_messenger.png',) : ImageAsset(path: 'assets/icon/ic_bot_messenger_focus.png',),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex != 3 ? ImageAsset(path: 'assets/icon/ic_bot_shop.png',) : ImageAsset(path: 'assets/icon/ic_bot_shop_focus.png',),
          label: 'My Order',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex != 4 ? ImageAsset(path: 'assets/icon/ic_bot_account.png',): ImageAsset(path: 'assets/icon/ic_bot_account_focus.png',),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );
  }
}